import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// [SecondHelpWidget] is modification of a [HelpWidget] described as second
/// type.
class SecondHelpWidget extends StatelessWidget {
  /// A title of a widget.
  final String title;

  /// A description for the button that will be shown on the main card.
  final String detailsButtonDescription;

  static const _defaultTitle = 'Stop War! You can help!';
  static const _widgetWidth = 290.0;
  static const _defaultDetailsButtonDesc = 'See what you can do';

  ///Constructor
  const SecondHelpWidget({
    Key? key,
    this.title = _defaultTitle,
    this.detailsButtonDescription = _defaultDetailsButtonDesc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HelpWidget(
      constraints: const BoxConstraints(
        maxWidth: _widgetWidth,
      ),
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
        return Stack(
          key: const ValueKey(1),
          clipBehavior: Clip.none,
          children: [
            CardRounded(
              onClose: controller.onClose,
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
                  const Divider(
                    height: 20,
                    thickness: 0.1,
                    color: Colors.black,
                  ),
                  DetailsButton(
                    title: _defaultDetailsButtonDesc,
                    color: HelpColors.blue,
                    onTap: controller.onDetails,
                  ),
                ],
              ),
            ),
            const Positioned(
              top: -25,
              left: 105,
              child: UkraineFlagWidget(),
            ),
          ],
        );
      },
    );
  }
}
