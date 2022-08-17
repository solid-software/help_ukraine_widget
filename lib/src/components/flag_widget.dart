import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// A widget with Ukraine flag colors
class FlagWidget extends StatelessWidget {
  /// Constructor
  const FlagWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _FlagPart(color: HelpColors.blue),
        _FlagPart(color: HelpColors.yellow),
      ],
    );
  }
}

class _FlagPart extends StatelessWidget {
  final Color color;

  const _FlagPart({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(color: color));
  }
}
