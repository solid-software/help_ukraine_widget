import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// [FirstHelpWidget] is modification of a [HelpWidget] described as first
/// type.
class FirstHelpWidget extends StatelessWidget {
  /// A title of a widget.
  final String title;

  static const _defaultTitle = 'Stop War! You can help!';

  final _controller = HelpWidgetViewController(HelpWidgetView.collapsed);

  ///Constructor
  FirstHelpWidget({
    Key? key,
    this.title = _defaultTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HelpWidget(
      controller: _controller,
      options: defaultOptionsList,
      collapsedView: const DefaultUkraineFlagWidget(),
      optionsView: CardRounded(
        key: const ValueKey(2),
        child: LinksCardWidget(
          onClose: _controller.goBack,
          options: [],
        ),
      ),
      mainView: CardRounded(
        key: const ValueKey(1),
        onClose: _controller.close,
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
                  onTap: _controller.showOptions,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
