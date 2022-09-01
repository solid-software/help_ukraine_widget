import 'package:flutter/material.dart';

/// [OverlayWidget] need to drop in the widget to predefined location on screen.
class OverlayWidget extends StatelessWidget {
  /// Child widget.
  final Widget child;

  /// Overlay widget.
  final Widget overlayWidget;

  /// Alignment.
  final Alignment alignment;

  /// Constructor.
  const OverlayWidget({
    Key? key,
    required this.child,
    required this.overlayWidget,
    required this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Align(
          alignment: alignment,
          child: overlayWidget,
        ),
      ],
    );
  }
}
