import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// [FlagCard] displays a [CardRounded] with a
/// [UkraineFlagWidget] inside
class FlagCard extends StatelessWidget {
  ///Constructor
  const FlagCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      key: key,
      cursor: SystemMouseCursors.click,
      child: const CardRounded(
        child: UkraineFlagWidget(),
      ),
    );
  }
}
