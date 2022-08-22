import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// [FirstHelpWidget] is modification of a [HelpWidget] described as first
/// type.
class FirstHelpWidget extends StatelessWidget {
  /// A title of a widget.
  final String title;

  /// A description for the button that will be shown on the main card.
  final String detailsButtonDescription;

  static const _defaultTitle = 'Stop Russian Aggression!';
  static const _defaultDetailsButtonDesc = 'See what you can do';

  ///Constructor
  FirstHelpWidget({
    Key? key,
    this.title = _defaultTitle,
    this.detailsButtonDescription = _defaultDetailsButtonDesc,
  }) : super(key: key);

  final _controller = HelpWidgetViewController(HelpWidgetView.collapsed);
  @override
  Widget build(BuildContext context) {
    return HelpWidget(
      controller: _controller,
      optionsView: CardRounded(
        padding: const EdgeInsets.only(right: 3, left: 3, bottom: 12, top: 6),
        child: LinksCardWidget(
          options: defaultOptionsList,
          onClose: _controller.showMainView,
        ),
      ),
      mainView: CardRounded(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 12,
          left: 12,
          right: 12,
        ),
        onClose: _controller.showCollapsedView,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const UkraineFlagWidget(),
            const SizedBox(width: 14),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Padding(
                //   padding: EdgeInsets.only(top: 2.0),
                // ),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20.8,
                    fontWeight: FontWeight.w700,
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
