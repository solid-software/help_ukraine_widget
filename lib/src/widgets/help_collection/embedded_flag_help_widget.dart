import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/components/buttons/details_button.dart';
import 'package:help_ukraine_widget/src/helpers/option_helper.dart';

/// Variation of a [HelpUkraineWidget] with flag embedded into the card.
class EmbeddedFlagHelpWidget extends StatelessWidget {
  final _controller = TraverseController(
    [
      HelpUkraineWidgetView.collapsed,
      HelpUkraineWidgetView.main,
      HelpUkraineWidgetView.options
    ],
  );

  /// part before flag
  final String firstPartOfTitle;

  /// part after flag
  final String secondPartOfTitle;

  /// A description for widget.
  final String description;

  /// A description for the button that will be shown on the main card.
  final String detailsButtonDescription;

  static const _defaultFirstTitle = 'Help';
  static const _defaultSecondTitle = 'Ukraine win!';
  static const _defaultDescription = '#StandWithUkraine';
  static const _defaultDetailsButtonDesc = 'See how to help';

  static const _flagWidth = 12.8;
  static const _cardHeight = 126.36;

  static const _titleFontSize = 20.8;
  static const _titleLineHeight = 1.23;
  static const _titleOpacity = 0.8;
  static const _titleFlagSize = 19.5;
  static const _subTitleFontSize = 19.2;
  static const _subTitleOpacity = 0.6;

  static const _widgetWidth = 246.39;

  static const _letterSpacing = -0.1;
  static const _wordSpacing = -0.1;

  /// Constructor
  EmbeddedFlagHelpWidget({
    Key? key,
    this.firstPartOfTitle = _defaultFirstTitle,
    this.secondPartOfTitle = _defaultSecondTitle,
    this.description = _defaultDescription,
    this.detailsButtonDescription = _defaultDetailsButtonDesc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HelpUkraineWidget(
      controller: _controller,
      optionsView: CardRounded(
        padding: const EdgeInsets.only(top: 12.0, bottom: 15.8),
        child: SizedBox(
          width: _widgetWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LinksCardWidget(
                options: OptionHelper.getOptionsList(),
                onClose: _controller.goBack,
                chevronSize: const Size.square(6.5),
              ),
            ],
          ),
        ),
      ),
      mainView: CardRounded(
        height: _cardHeight,
        padding: const EdgeInsets.only(right: 12.8),
        closeButtonAlignment: const Alignment(1.022, -1.022),
        onClose: _controller.goBack,
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
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      firstPartOfTitle,
                      style: TextThemes.mainFont.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: _titleFontSize,
                        height: _titleLineHeight,
                        color: HelpColors.black.withOpacity(_titleOpacity),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6, right: 4.95),
                      child: SvgPicture.asset(
                        "lib/assets/svg/flag.svg",
                        package: "help_ukraine_widget",
                        width: _titleFlagSize,
                      ),
                    ),
                    Text(
                      secondPartOfTitle,
                      style: TextThemes.mainFont.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: _titleFontSize,
                        height: _titleLineHeight,
                        letterSpacing: _letterSpacing,
                        color: HelpColors.black.withOpacity(_titleOpacity),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.2, bottom: 15),
                  child: Text(
                    description,
                    style: TextThemes.mainFont.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: _subTitleFontSize,
                      color: HelpColors.black.withOpacity(_subTitleOpacity),
                      letterSpacing: _letterSpacing,
                    ),
                  ),
                ),
                DetailsButton(
                  title: detailsButtonDescription,
                  color: HelpColors.blue,
                  onTap: _controller.goForward,
                  wordSpacing: _wordSpacing,
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
