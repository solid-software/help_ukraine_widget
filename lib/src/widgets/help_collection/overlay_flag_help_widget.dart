import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// Variation of a [HelpWidget] with flag overlaping the card.
class OverlayFlagHelpWidget extends StatelessWidget {
  final _controller = TraverseController(
    [HelpWidgetView.collapsed, HelpWidgetView.main, HelpWidgetView.options],
  );

  /// A title of a widget.
  final String title;

  /// A description for the button that will be shown on the main card.
  final String detailsButtonDescription;

  static const _defaultTitle = 'Stop War! You can help!';
  static const _widgetWidth = 290.0;
  static const _defaultDetailsButtonDesc = 'See what you can do';

  /// Constructor
  OverlayFlagHelpWidget({
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
      controller: _controller,
      optionsView: CardRounded(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LinksCardWidget(
              options: defaultOptionsList,
              onClose: _controller.goBack,
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
      mainView: Stack(
        clipBehavior: Clip.none,
        children: [
          CardRounded(
            onClose: _controller.goBack,
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
                  onTap: _controller.goForward,
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
      ),
      collapsedView: GestureDetector(
        onTap: _controller.goForward,
        child: const FlagCard(),
      ),
    );
  }
}
