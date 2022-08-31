import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// Variation of a [HelpWidget] with almost equal height and width.
class SquareHelpWidget extends StatelessWidget {
	final _controller = HelpWidgetViewController(HelpWidgetView.collapsed);

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
  static const _textOpacity = 0.8;
  static const _rightClosePosition = -3.0;
  static const _topClosePosition = -1.0;
  static const _bottomClosePosition = -2.0;
  static const _optionsWidth = 246.39;

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
        customButtonIcon: SFSymbols.chevron_left,
        onClose: _controller.showMainView,
        // closeButtonAlignment: Alignment.bottomRight,
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
        onClose: _controller.showCollapsedView,
        rightPosition: _rightClosePosition,
        topPosition: _topClosePosition,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: _fontSize,
                    height: _lineHeight,
                    color: HelpColors.blue.withOpacity(_textOpacity),
                  ),
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: _fontSize,
                    height: _lineHeight,
                    color: HelpColors.yellow.withOpacity(_textOpacity),
                  ),
            ),
            const SizedBox(height: 12.8),
            RoundedButton(
              onTap: _controller.showOptionsView,
              title: _defaultDetailsButtonDesc,
            ),
          ],
        ),
      ),
      collapsedView: const FlagCard(),
    );
  }
}
