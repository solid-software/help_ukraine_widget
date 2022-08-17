import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

class FirstHelpWidget extends StatelessWidget {
  /// A title of a widget.
  final String title;

  static const _defaultTitle = 'Stop War! You can help!';

  ///Constructor
  const FirstHelpWidget({
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
        return CardRounded(
          key: const ValueKey(1),
          onClose: controller.onClose,
          child: Row(
            children: [
              const DefaultUkraineFlagWidget(),
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
