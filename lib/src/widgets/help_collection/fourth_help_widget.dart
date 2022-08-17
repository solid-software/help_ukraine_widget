import 'package:flutter/material.dart';

import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// [FourthHelpWidget] is modification of a [HelpWidget] described as fourth
/// type.
class FourthHelpWidget extends StatelessWidget {
  /// A title of widget.
  final String title;

  ///A description for widget.
  final String description;

  /// A description for the button that will be shown on the main card.
  final String detailsButtonDescription;

  static const _defaultTitle = 'Help 🇺🇦 Ukraine win!';
  static const _defaultDescription = '#StandWithUkraine';
  static const _defaultDetailsButtonDesc = 'See how to help';

  static const _flagWidth = 13.0;
  static const _cardHeight = 120.0;

  ///Constructor
  const FourthHelpWidget({
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
      optionsView: CardRounded(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LinksCardWidget(
              options: defaultOptionsList,
              onClose: _controller.showMainView,
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
      mainView: CardRounded(
        height: _cardHeight,
        padding: const EdgeInsets.only(right: 12),
        onClose: _controller.showCollapsedView,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: _flagWidth,
              child: FlagWidget(),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 15),
                DetailsButton(
                  title: detailsButtonDescription,
                  color: Colors.blueAccent,
                  onTap: _controller.showOptionsView,
                ),
              ],
            ),
          ],
        ),
      ),
      collapsedView: const UkraineFlagWidget(),
    );
  }
}
