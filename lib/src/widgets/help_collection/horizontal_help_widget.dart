import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/components/buttons/details_button.dart';
import 'package:help_ukraine_widget/src/helpers/default_options.dart';
import 'package:help_ukraine_widget/src/theme/font_config.dart';

/// Shortest and widest of variations of [HelpWidget].
class HorizontalHelpWidget extends StatelessWidget {
  final _controller = TraverseController(
    [HelpWidgetView.collapsed, HelpWidgetView.main, HelpWidgetView.options],
  );

  /// A title of a widget.
  final String title;

  /// A description for the button that will be shown on the main card.
  final String detailsButtonDescription;

  static const _defaultTitle = 'Stop Russian Aggression!';
  static const _defaultDetailsButtonDesc = 'See what you can do';

  /// It's a letter spacing for details button's title
  static const _letterSpacing = -0.12;

  /// It's a word spacing for details button's title
  static const _wordSpacing = 0.3;

  /// Constructor
  HorizontalHelpWidget({
    Key? key,
    this.title = _defaultTitle,
    this.detailsButtonDescription = _defaultDetailsButtonDesc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HelpWidget(
      controller: _controller,
      optionsView: Container(
        constraints: const BoxConstraints.tightFor(width: 340),
        child: CardRounded(
          padding: const EdgeInsets.only(right: 3, left: 3, bottom: 10, top: 6),
          child: LinksCardWidget(
            options: hugeOptionsList,
            onClose: _controller.goBack,
            huge: true,
          ),
        ),
      ),
      mainView: CardRounded(
        padding: const EdgeInsets.only(
          top: 11,
          bottom: 12,
          left: 12.4,
          right: 12.1,
        ),
        onClose: _controller.goBack,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 0.95),
                child: UkraineFlagWidget(),
              ),
              const SizedBox(width: 13),
              Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: FontConfig.family,
                        fontSize: 20.8,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 0.5),
                    DetailsButton(
                      title: detailsButtonDescription,
                      color: HelpColors.blue,
                      onTap: _controller.goForward,
                      letterSpacing: _letterSpacing,
                      wordSpacing: _wordSpacing,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      collapsedView: GestureDetector(
        onTap: _controller.goForward,
        child: const FlagCard(),
      ),
    );
  }
}
