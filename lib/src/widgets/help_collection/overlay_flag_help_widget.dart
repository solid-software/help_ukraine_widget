import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/components/buttons/details_button.dart';
import 'package:help_ukraine_widget/src/helpers/default_options.dart';

/// Variation of a [HelpWidget] with flag overlaping the card.
class OverlayFlagHelpWidget extends StatelessWidget {
  final _controller = TraverseController(
    [HelpWidgetView.collapsed, HelpWidgetView.main, HelpWidgetView.options],
  );

  /// A title of a widget.
  final String title;

  /// A description for the button that will be shown on the main card.
  final String detailsButtonDescription;

  static const _defaultTitle = 'Stop War! You can help!';
  static const _defaultDetailsButtonDesc = 'See what you can do';
  static const _mainWidth = 258.0;
  static const _optionsWidth = 255.56;

  /// Constructor
  OverlayFlagHelpWidget({
    Key? key,
    this.title = _defaultTitle,
    this.detailsButtonDescription = _defaultDetailsButtonDesc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const mainViewTitleFontSize = 20.8;
    const opacity = 0.8;

    return HelpWidget(
      controller: _controller,
      optionsView: SizedBox(
        width: _optionsWidth,
        child: CardRounded(
          padding: const EdgeInsets.symmetric(vertical: 12.8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LinksCardWidget(
                options: defaultOptionsList,
                onClose: _controller.goBack,
              ),
            ],
          ),
        ),
      ),
      mainView: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: _mainWidth,
            child: CardRounded(
              padding: const EdgeInsets.fromLTRB(10, 40.4, 10, 13.8),
              closeButtonAlignment: const Alignment(1.02, -1),
              onClose: _controller.goBack,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextThemes.mainFont.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: mainViewTitleFontSize,
                      color: HelpColors.black.withOpacity(opacity),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: HelpColors.separatorColor,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  DetailsButton(
                    onTap: _controller.goForward,
                    color: HelpColors.blue,
                    title: _defaultDetailsButtonDesc,
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            top: -19.6,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: UkraineFlagWidget(),
            ),
          ),
        ],
      ),
      collapsedView: GestureDetector(
        onTap: _controller.goForward,
        child: const FlagCard(),
      ),
    );
  }
}
