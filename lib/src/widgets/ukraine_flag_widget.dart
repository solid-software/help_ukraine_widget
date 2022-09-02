import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// [UkraineFlagWidget] is a modification of a [FlagWidget]
class UkraineFlagWidget extends StatelessWidget {
  ///
  const UkraineFlagWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const size = 51.5;
    const borderRadius = 13.0;

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      clipBehavior: Clip.hardEdge,
      child: const FlagWidget(),
    );
  }
}
