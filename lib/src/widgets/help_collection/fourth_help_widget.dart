import 'package:flutter/material.dart';

import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// [FourthHelpWidget] is modification of a [HelpWidget] described as fourth
/// type.
class FourthHelpWidget extends StatelessWidget {
  /// A title of widget.
  final String title;

  ///A description for widget.
  final String description;

  /// A description for the button that will be shown on the main card.
  final String detailsButtonDescription;

  static const _defaultTitle = 'Help 🇺🇦 Ukraine win!';
  static const _defaultDescription = '#StandWithUkraine';
  static const _defaultDetailsButtonDesc = 'See how to help';

  ///Constructor
  const FourthHelpWidget({
    Key? key,
    this.title = _defaultTitle,
    this.description = _defaultDescription,
    this.detailsButtonDescription = _defaultDetailsButtonDesc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HelpWidget(
      optionsCardBuilder: (controller) {
        return CardRounded(
          padding: const EdgeInsets.symmetric(vertical: 13),
          key: const ValueKey(2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LinksCardWidget(
                options: defaultOptionsList,
                onClose: controller.onClose,
              ),
              const SizedBox(height: 5),
            ],
          ),
        );
      },
      mainCardBuilder: (controller) {
        const flagWidth = 13.0;
        const cardHeight = 120.0;

        return CardRounded(
          height: cardHeight,
          key: const ValueKey(1),
          padding: const EdgeInsets.only(right: 12),
          onClose: controller.onClose,
          child: Row(
            mainAxisSize: MainAxisSize.min,
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
                    title: detailsButtonDescription,
                    color: Colors.blueAccent,
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
