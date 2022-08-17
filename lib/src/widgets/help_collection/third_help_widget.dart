import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// [ThirdHelpWidget] is modification of a [HelpWidget] described as third type.
class ThirdHelpWidget extends StatelessWidget {
  /// A title of widget.
  final String title;

  ///A description for widget.
  final String description;

  /// A description for the button that will be shown on the main card.
  final String detailsButtonDescription;

  static const _defaultTitle = 'Stop War!';
  static const _defaultDescription = 'Help Ukraine!';
  static const _defaultDetailsButtonDesc = 'See how';
  static const _widgetWidth = 320.0;

  ///Constructor
  const ThirdHelpWidget({
    Key? key,
    this.title = _defaultTitle,
    this.description = _defaultDescription,
    this.detailsButtonDescription = _defaultDetailsButtonDesc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = HelpWidgetViewController(HelpWidgetView.collapsed);

    return HelpWidget(
      controller: _controller,
      constraints: const BoxConstraints(
        maxWidth: _widgetWidth,
      ),
      axis: Axis.horizontal,
      optionsView: CardRounded(
        customButtonIcon: SFSymbols.chevron_left,
        onClose: _controller.showMainView,
        closeButtonAlignment: Alignment.bottomRight,
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: defaultOptionsList,
        ),
      ),
      mainView: CardRounded(
        onClose: _controller.showCollapsedView,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.blueAccent,
                  ),
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.yellow,
                  ),
            ),
            const SizedBox(height: 15),
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
