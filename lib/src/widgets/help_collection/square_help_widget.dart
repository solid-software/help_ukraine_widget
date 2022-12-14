import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/helpers/option_helper.dart';

/// Variation of a [HelpUkraineWidget] with almost equal height and width.
class SquareHelpWidget extends StatelessWidget {
  final _controller = TraverseController(
    [
      HelpUkraineWidgetView.collapsed,
      HelpUkraineWidgetView.main,
      HelpUkraineWidgetView.options,
    ],
  );

  /// A title of widget.
  final String title;

  /// A description for widget.
  final String description;

  /// A description for the button that will be shown on the main card.
  final String detailsButtonDescription;

  static const _defaultTitle = 'Stop War!';
  static const _defaultDescription = 'Help Ukraine!';
  static const _defaultDetailsButtonDesc = 'See how';
  static const _lineHeight = 1.28571;
  static const _fontSize = 22.4;
  static const _fontWeight = FontWeight.w900;
  static const _textOpacity = 0.8;
  static const _optionsWidth = 246.39;
  static const _lineWidth = 2.0;
  static const _chevronSize = 5.625;
  static const _chevronOffset = Offset(-1.5, 0);

  /// Constructor
  SquareHelpWidget({
    Key? key,
    this.title = _defaultTitle,
    this.description = _defaultDescription,
    this.detailsButtonDescription = _defaultDetailsButtonDesc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HelpUkraineWidget(
      controller: _controller,
      axis: Axis.horizontal,
      optionsView: CardRounded(
        onClose: _controller.goBack,
        closeButtonIcon: Transform.translate(
          offset: _chevronOffset,
          child: const Center(
            child: Chevron(
              size: Size.square(_chevronSize),
              color: Colors.white,
              lineWidth: _lineWidth,
              direction: ChevronDirection.left,
            ),
          ),
        ),
        closeButtonAlignment: const Alignment(1.022, 1.022),
        padding: const EdgeInsets.only(top: 12.3, bottom: 13.3),
        child: SizedBox(
          width: _optionsWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: OptionHelper.getOptionsList(),
          ),
        ),
      ),
      mainView: CardRounded(
        padding: const EdgeInsets.only(
          top: 24.6,
          bottom: 13.3,
          left: 12.0,
          right: 12.0,
        ),
        onClose: _controller.goBack,
        closeButtonAlignment: const Alignment(1.028, -1.015),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextThemes.mainFont.copyWith(
                fontWeight: _fontWeight,
                fontSize: _fontSize,
                height: _lineHeight,
                color: HelpColors.blue.withOpacity(_textOpacity),
              ),
            ),
            Text(
              description,
              style: TextThemes.mainFont.copyWith(
                fontWeight: _fontWeight,
                fontSize: _fontSize,
                height: _lineHeight,
                color: HelpColors.yellow.withOpacity(_textOpacity),
              ),
            ),
            const SizedBox(height: 13.4),
            RoundedButton(
              onTap: _controller.goForward,
              title: _defaultDetailsButtonDesc,
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
