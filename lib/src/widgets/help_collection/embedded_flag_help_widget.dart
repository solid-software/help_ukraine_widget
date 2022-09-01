import 'package:flutter/material.dart';

import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// Variation of a [HelpWidget] with flag embedded into the card.
class EmbeddedFlagHelpWidget extends StatelessWidget {
  final _controller = HelpWidgetViewController(HelpWidgetView.collapsed);

  /// A title of widget.
  final String title;

  /// A description for widget.
  final String description;

  /// A description for the button that will be shown on the main card.
  final String detailsButtonDescription;

  static const _defaultTitle = 'Help 🇺🇦 Ukraine win!';
  static const _defaultDescription = '#StandWithUkraine';
  static const _defaultDetailsButtonDesc = 'See how to help';

  static const _flagWidth = 12.8;
  static const _cardHeight = 126.36;

  static const _titleFontSize = 20.8;
  static const _titleLineHeight = 1.23;
  static const _titleOpacity = 0.8;
  static const _letterSpacing = -0.6;
  static const _subTitleFontSize = 19.2;
  static const _subTitleOpacity = 0.6;

  static const _rightPosition = -2.0;
  static const _topPosition = -1.0;

  static const _widgetWidth = 246.39;

  /// Constructor
  EmbeddedFlagHelpWidget({
    Key? key,
    this.title = _defaultTitle,
    this.description = _defaultDescription,
    this.detailsButtonDescription = _defaultDetailsButtonDesc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HelpWidget(
      controller: _controller,
      optionsView: CardRounded(
        padding: const EdgeInsets.symmetric(vertical: 12.8),
        child: SizedBox(
          width: _widgetWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LinksCardWidget(
                options: defaultOptionsList,
                onClose: _controller.showMainView,
              ),
            ],
          ),
        ),
      ),
      mainView: CardRounded(
        height: _cardHeight,
        padding: const EdgeInsets.only(right: 12.8),
        rightPosition: _rightPosition,
        topPosition: _topPosition,
        onClose: _controller.showCollapsedView,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: _flagWidth,
              child: FlagWidget(),
            ),
            const SizedBox(width: 12.8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 3,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: _titleFontSize,
                        height: _titleLineHeight,
                        letterSpacing: _letterSpacing,
                        color: HelpColors.black.withOpacity(_titleOpacity),
                      ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 3.2, bottom: 15.8, left: 2.0),
                  child: Text(
                    description,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: _subTitleFontSize,
                          color: HelpColors.black.withOpacity(_subTitleOpacity),
                        ),
                  ),
                ),
                DetailsButton(
                  title: detailsButtonDescription,
                  color: HelpColors.blue,
                  onTap: _controller.showOptionsView,
                ),
              ],
            ),
          ],
        ),
      ),
      collapsedView: const FlagCard(),
    );
  }
}
