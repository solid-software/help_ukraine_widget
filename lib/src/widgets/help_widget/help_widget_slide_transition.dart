import 'package:flutter/material.dart';

/// [SlideTransition] for [HelpWidget]
class HelpWidgetSlideTransition extends StatelessWidget {
	/// position for [SlideTransition]
  final Animation<Offset> animation;
	/// child for [SlideTransition]
  final Widget child;

	/// Constructor
  const HelpWidgetSlideTransition(this.animation, this.child, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.all(12.0);

    return SlideTransition(
      position: animation,
      child: Padding(padding: padding, child: child),
    );
  }
}
