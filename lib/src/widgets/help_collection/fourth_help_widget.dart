import 'package:flutter/material.dart';

import 'package:help_ukraine_widget/help_ukraine_widget.dart';

class FourthHelpWidget extends StatelessWidget {
  /// A title of widget.
  final String title;

  ///A description for widget.
  final String description;

  static const _defaultTitle = 'Help 🇺🇦 Ukraine win!';
  static const _defaultDescription = '#StandWithUkraine';

  ///Constructor
  const FourthHelpWidget({
    Key? key,
    this.title = _defaultTitle,
    this.description = _defaultDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HelpWidget(
      options: defaultOptionsList,
      optionsCardBuilder: (controller) {
        return CardRounded(
          key: const ValueKey(2),
          child: LinksCardWidget(
            options: controller.options,
            onClose: controller.onClose,
          ),
        );
      },
      mainCardBuilder: (controller) {
        const flagWidth = 13.0;
        const cardHeight = 120.0;

        return CardRounded(
          height: cardHeight,
          key: const ValueKey(1),
          padding: EdgeInsets.zero,
          onClose: controller.onClose,
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
                  Text(
                    description,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(height: 15),
                  DetailsButton(
                    title: 'See what you can do',
                    hoverColor: Colors.blueAccent,
                    onTap: controller.onDetails,
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
