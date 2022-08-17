import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// [FlagCard] displays a [CardRounded] with a
/// [DefaultFlagWidget] inside
class FlagCard extends StatelessWidget {
  ///Constructor
  const FlagCard({Key key = const ValueKey(0)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MouseRegion(
      cursor: SystemMouseCursors.click,
      child: CardRounded(
        child: UkraineFlagWidget(),
      ),
    );
  }
}
