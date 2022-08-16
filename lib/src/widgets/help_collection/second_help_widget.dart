import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

class SecondHelpWidget extends StatelessWidget {
  const SecondHelpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HelpWidget(
      mainCardTitle: 'Stop War! You can help!',
      options: defaultOptionsList,
      optionsCardBuilder: (options, onClose) {
        return CardRounded(
          key: const ValueKey(2),
          child: LinksCardWidget(
            options: options,
            onHidePressed: onClose,
          ),
        );
      },
      mainCardBuilder: (flag, title, desc, onDetails, onClose) {
        return Stack(
          key: const ValueKey(1),
          clipBehavior: Clip.none,
          children: [
            CardRounded(
              onClose: onClose,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 25),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(
                    width: 220,
                    child: Divider(height: 20),
                  ),
                  DetailsButton(
                    title: 'See what you can do',
                    hoverColor: Colors.blueAccent,
                    onTap: onDetails,
                  ),
                ],
              ),
            ),
            Positioned(
              top: -26,
              left: 105,
              // right: 0,
              child: flag,
            ),
          ],
        );
      },
    );
  }
}
