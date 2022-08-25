import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/theme/font_config.dart';
import 'package:help_ukraine_widget/src/widgets/default_links_card_widget.dart';

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
  static const _widgetWidth = 280.0;
  static const _defaultDetailsButtonDesc = 'See what you can do';

  /// Constructor
  OverlayFlagHelpWidget({
    Key? key,
    this.title = _defaultTitle,
    this.detailsButtonDescription = _defaultDetailsButtonDesc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const linkFontSize = 18.0;

    const mainViewTitleLetterSpacing = 0.2;
    const mainViewTitleFontSize = 19.6;

    const detailsButtonFontSize = 18.0;
    const detailsButtonLetterSpacing = -0.2;
    const detailsButtonSpacingToChevron = 8.0;
    const detailsButtonSpacingAfterChevron = 6.0;

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
            DefaultLinksCardWidget(
              textStyle: theme.textTheme.headline4?.copyWith(
                fontSize: linkFontSize,
                color: HelpColors.blue,
                fontWeight: FontWeight.w500,
              ),
              iconTextStyle: const TextStyle(
                fontFamily: FontConfig.family,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
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
            closeButtonAlignment: const Alignment(1.02, -1.02),
            onClose: _controller.goBack,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 31),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.w600,
                        letterSpacing: mainViewTitleLetterSpacing,
                        fontSize: mainViewTitleFontSize,
                      ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    const SizedBox(
                      width: 3,
                    ),
                    Expanded(
                      child: Container(
                        color: const Color(0xffe5e5e5),
                        height: 1,
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                DetailsButton(
                  title: _defaultDetailsButtonDesc,
                  color: HelpColors.blue,
                  onTap: _controller.goForward,
                  fontSize: detailsButtonFontSize,
                  letterSpacing: detailsButtonLetterSpacing,
                  spacingToChevron: detailsButtonSpacingToChevron,
                  spacingAfterChevron: detailsButtonSpacingAfterChevron,
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
          const Positioned(
            top: -21,
            left: 102,
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
