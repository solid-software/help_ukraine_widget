import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

class FirstHelpWidget extends StatelessWidget {
  ///Constructor
  const FirstHelpWidget({Key? key}) : super(key: key);

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
        return CardRounded(
          key: const ValueKey(1),
          onClose: onClose,
          child: Row(
            children: [
              flag,
              const SizedBox(width: 10),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  DetailsButton(
                    title: 'See what you can do',
                    hoverColor: Colors.blueAccent,
                    onTap: onDetails,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
