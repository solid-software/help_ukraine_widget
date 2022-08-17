import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// [SecondHelpWidget] is modification of a [HelpWidget] described as second
/// type.
class SecondHelpWidget extends StatelessWidget {
  /// A title of a widget.
  final String title;

  static const _defaultTitle = 'Stop War! You can help!';

  ///Constructor
  const SecondHelpWidget({
    Key? key,
    this.title = _defaultTitle,
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
                  const SizedBox(
                    width: 220,
                    child: Divider(height: 20),
                  ),
                  DetailsButton(
                    title: 'See what you can do',
                    hoverColor: Colors.blueAccent,
                    onTap: controller.onDetails,
                  ),
                ],
              ),
            ),
            const Positioned(
              top: -26,
              left: 105,
              // right: 0,
              child: DefaultUkraineFlagWidget(),
            ),
          ],
        );
      },
    );
  }
}
