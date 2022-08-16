import 'package:flutter/material.dart';

import 'package:help_ukraine_widget/help_ukraine_widget.dart';

class FourthHelpWidget extends StatelessWidget {
  ///Constructor
  const FourthHelpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HelpWidget(
      mainCardTitle: 'Help 🇺🇦 Ukraine win!',
      mainCardDescription: '#StandWithUkraine',
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
      mainCardBuilder: (_, title, desc, onDetails, onClose) {
        const flagWidth = 13.0;
        const cardHeight = 120.0;

        return CardRounded(
          height: cardHeight,
          key: const ValueKey(1),
          padding: EdgeInsets.zero,
          onClose: onClose,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: flagWidth,
                child: FlagWidget(),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  if (desc != null)
                    Text(
                      desc,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  const SizedBox(height: 15),
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
