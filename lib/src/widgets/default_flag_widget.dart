import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

class DefaultUkraineFlagWidget extends StatelessWidget {
  ///Constructor
  const DefaultUkraineFlagWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const size = 51.0;
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
