import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/components/chevron_down.dart';

/// Variation of a [HelpWidget] with almost equal height and width.
class SquareHelpWidget extends StatelessWidget {
  final _controller = TraverseController(
    [HelpWidgetView.collapsed, HelpWidgetView.main, HelpWidgetView.options],
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
  static const _widgetWidth = 320.0;
  static const _lineHeight = 1.28571;
  static const _fontSize = 22.4;
  static const _fontWeight = FontWeight.w900;
  static const _textOpacity = 0.8;
  static const _rightClosePosition = -3.0;
  static const _topClosePosition = -1.0;
  static const _bottomClosePosition = -2.0;
  static const _optionsWidth = 246.39;
  static const _lineWidth = 6.0;
  static const _iconSize = 7.0;
  static const _angle = 3.1415 / 2;
  static const _scaleX = 0.3;
  static const _scaleY = 0.3;
  static const _letterSpacing = 0.5;
  static const _wordSpacing = -3.0;
  static const _offset = Offset(16, 0);

  /// Constructor
  SquareHelpWidget({
    Key? key,
    this.title = _defaultTitle,
    this.description = _defaultDescription,
    this.detailsButtonDescription = _defaultDetailsButtonDesc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HelpWidget(
      controller: _controller,
      constraints: const BoxConstraints(
        maxWidth: _widgetWidth,
      ),
      axis: Axis.horizontal,
      optionsView: CardRounded(
        onClose: _controller.goBack,
        closeButtonIcon: Transform.scale(
          scaleX: _scaleX,
          scaleY: _scaleY,
          alignment: Alignment.centerLeft,
          child: Transform.translate(
            offset: _offset,
            child: Transform.rotate(
              angle: _angle,
              child: const ChevronDown(
                size: Size.square(_iconSize),
                color: Colors.white,
                lineWidth: _lineWidth,
              ),
            ),
          ),
        ),
        rightPosition: _rightClosePosition,
        bottomPosition: _bottomClosePosition,
        padding: const EdgeInsets.symmetric(vertical: 12.8),
        child: SizedBox(
          width: _optionsWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: defaultOptionsList,
          ),
        ),
      ),
      mainView: CardRounded(
        padding: const EdgeInsets.only(
          top: 25.6,
          bottom: 12.8,
          left: 12.8,
          right: 12.8,
        ),
        onClose: _controller.goBack,
        rightPosition: _rightClosePosition,
        topPosition: _topClosePosition,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: _fontWeight,
                    fontSize: _fontSize,
                    height: _lineHeight,
                    color: HelpColors.blue.withOpacity(_textOpacity),
                    letterSpacing: _letterSpacing,
                    wordSpacing: _wordSpacing,
                  ),
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: _fontWeight,
                    fontSize: _fontSize,
                    height: _lineHeight,
                    color: HelpColors.yellow.withOpacity(_textOpacity),
                    letterSpacing: _letterSpacing,
                    wordSpacing: _wordSpacing,
                  ),
            ),
            const SizedBox(height: 12.8),
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
