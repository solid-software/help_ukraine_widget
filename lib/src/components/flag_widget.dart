import 'package:flutter/material.dart';

/// A widget with Ukraine flag colors
class FlagWidget extends StatelessWidget {
  /// Constructor
  const FlagWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _FlagPart(color: Colors.blue),
        _FlagPart(color: Colors.yellow),
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
