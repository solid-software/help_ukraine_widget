import 'package:flutter/material.dart';

import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// button for [CardRounded]
class CloseButtonCardRounded extends StatelessWidget {
	/// callback called onTap
  final VoidCallback? onTap;

	/// icon
  final IconData? iconData;

	/// Constructor
  const CloseButtonCardRounded({
    Key? key,
    this.onTap,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _size = 20.0;
    const _iconSize = 10.0;

    return Container(
      height: _size,
      width: _size,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: HoverWrapper(
        backgroundColor: const Color.fromRGBO(80, 80, 80, 1),
        highlightColor: HelpColors.blue,
        onTap: onTap,
        child: Icon(
          iconData,
          size: _iconSize,
          color: Colors.white,
        ),
      ),
    );
  }
}