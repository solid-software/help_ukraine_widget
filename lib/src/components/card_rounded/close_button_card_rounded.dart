import 'package:flutter/material.dart';

import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// button for [CardRounded]
class CloseButtonCardRounded extends StatelessWidget {
  /// callback called onTap
  final VoidCallback? onTap;

  /// child
  final Widget child;

  /// Constructor
  const CloseButtonCardRounded({
    Key? key,
    required this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _size = 19.2;

    return Container(
      height: _size,
      width: _size,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: HoverWrapper(
        backgroundColor: const Color.fromRGBO(80, 80, 80, 1),
        highlightColor: HelpColors.blue,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
