import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/components/chevron_down.dart';
import 'package:help_ukraine_widget/src/helpers/default_options.dart';

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
  static const _lineHeight = 1.28571;
  static const _fontSize = 22.4;
  static const _fontWeight = FontWeight.w900;
  static const _textOpacity = 0.8;
  static const _optionsWidth = 246.39;
  static const _lineWidth = 6.0;
  static const _iconSize = 7.0;
  static const _angle = 3.1415 / 2;
  static const _scale = 0.3;
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
      axis: Axis.horizontal,
      optionsView: CardRounded(
        onClose: _controller.goBack,
        closeButtonIcon: Transform.scale(
          scale: _scale,
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
        closeButtonAlignment: const Alignment(1.022, 1.022),
        padding: const EdgeInsets.only(top: 12.3, bottom: 13.3),
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
