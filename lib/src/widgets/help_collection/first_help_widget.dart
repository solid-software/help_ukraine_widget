import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// [FirstHelpWidget] is modification of a [HelpWidget] described as first
/// type.
class FirstHelpWidget extends StatelessWidget {
  /// A title of a widget.
  final String title;

  /// A description for the button that will be shown on the main card.
  final String detailsButtonDescription;

  static const _defaultTitle = 'Stop Russian Aggression!';
  static const _defaultDetailsButtonDesc = 'See what you can do';

  ///Constructor
  const FirstHelpWidget({
    Key? key,
    this.title = _defaultTitle,
    this.detailsButtonDescription = _defaultDetailsButtonDesc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HelpWidget(
      optionsCardBuilder: (controller) {
        return CardRounded(
          padding: const EdgeInsets.only(right: 3, left: 3, bottom: 12, top: 6),
          key: const ValueKey(2),
          child: LinksCardWidget(
            options: defaultOptionsList,
            onClose: controller.onClose,
          ),
        );
      },
      mainCardBuilder: (controller) {
        return CardRounded(
          key: const ValueKey(1),
          onClose: controller.onClose,
          child: Row(
            children: [
              const UkraineFlagWidget(),
              const SizedBox(width: 10),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.headline4,
                  ),
                  DetailsButton(
                    title: detailsButtonDescription,
                    color: HelpColors.blue,
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
