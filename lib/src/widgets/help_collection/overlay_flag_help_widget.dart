import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/components/chevron_down.dart';
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
  static const _widgetWidth = 281.0;
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

    const mainViewTitleLetterSpacing = 0.5;
    const mainViewTitleFontSize = 20.0;

    const detailsButtonFontSize = 18.0;
    const detailsButtonLetterSpacing = 0.6;

    const chevronWidth = 6.4;
    const chevronHeight = 6.4;
    const lineWidth = 1.8;

    const detailsButtonSpacingToChevron = 8.0;
    const detailsButtonSpacingAfterChevron = 6.0;

    return HelpWidget(
      constraints: const BoxConstraints(
        maxWidth: _widgetWidth,
      ),
      controller: _controller,
      optionsView: CardRounded(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultLinksCardWidget(
              textStyle: theme.textTheme.headline4?.copyWith(
                fontSize: linkFontSize,
                color: HelpColors.blue,
                fontWeight: FontWeight.w600,
              ),
              iconTextStyle: const TextStyle(
                fontFamily: FontConfig.family,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              onClose: _controller.goBack,
            ),
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
                Padding(
                  padding: const EdgeInsets.only(top: 31.0, bottom: 15),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.w600,
                          letterSpacing: mainViewTitleLetterSpacing,
                          fontSize: mainViewTitleFontSize,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: HelpColors.separatorColor,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8, bottom: 4.0, left: 1.0),
                  child: TextButton(
                    onPressed: _controller.goForward,
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          _defaultDetailsButtonDesc,
                          style: TextStyle(
                            fontFamily: FontConfig.family,
                            fontSize: detailsButtonFontSize,
                            fontWeight: FontWeight.w600,
                            letterSpacing: detailsButtonLetterSpacing,
                            color: HelpColors.blue,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 4.0,
                            right: detailsButtonSpacingToChevron,
                            left: detailsButtonSpacingAfterChevron,
                          ),
                          child: SizedBox(
                            width: chevronWidth,
                            height: chevronHeight,
                            child: ChevronDown(
                              color: HelpColors.blue,
                              size: Size(chevronWidth, chevronHeight),
                              lineWidth: lineWidth,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
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
