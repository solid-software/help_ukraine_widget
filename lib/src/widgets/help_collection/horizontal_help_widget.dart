import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/components/chevron_down.dart';
import 'package:help_ukraine_widget/src/theme/font_config.dart';
import 'package:help_ukraine_widget/src/widgets/default_links_card_widget.dart';

/// Shortest and widest of variations of [HelpWidget].
class HorizontalHelpWidget extends StatelessWidget {
  final _controller = TraverseController(
    [HelpWidgetView.collapsed, HelpWidgetView.main, HelpWidgetView.options],
  );

  /// A title of a widget.
  final String title;

  /// A description for the button that will be shown on the main card.
  final String detailsButtonDescription;

  static const _defaultTitle = 'Stop Russian Aggression!';
  static const _defaultDetailsButtonDesc = 'See what you can do';

  /// Constructor
  HorizontalHelpWidget({
    Key? key,
    this.title = _defaultTitle,
    this.detailsButtonDescription = _defaultDetailsButtonDesc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const detailsButtonSpacingToChevron = 8.0;
    const detailsButtonSpacingAfterChevron = 6.0;
    const chevronWidth = 6.4;
    const chevronHeight = 6.4;
    const lineWidth = 1.8;

    return HelpWidget(
      controller: _controller,
      optionsView: Container(
        constraints: const BoxConstraints.tightFor(width: 340),
        child: CardRounded(
          padding: const EdgeInsets.only(right: 3, left: 3, bottom: 12, top: 6),
          child: LinksCardWidget(
            options: defaultOptionsList,
            onClose: _controller.goBack,
          ),
        ),
      ),
      mainView: CardRounded(
        padding: const EdgeInsets.only(
          top: 12,
          bottom: 12,
          left: 12,
          right: 12,
        ),
        onClose: _controller.goBack,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const UkraineFlagWidget(),
            const SizedBox(width: 14),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: FontConfig.family,
                    fontSize: 20.8,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.174,
                  ),
                ),
                const SizedBox(height: 0.5),
                TextButton(
                  onPressed: _controller.goForward,
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        detailsButtonDescription,
                        style: const TextStyle(
                          fontFamily: FontConfig.family,
                          fontSize: 19.2,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          color: HelpColors.blue,
                        ),
                      ),
                      const Padding(
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
              ],
            ),
          ],
        ),
      ),
      collapsedView: GestureDetector(
        onTap: _controller.goForward,
        child: const FlagCard(),
      ),
    );
  }
}
