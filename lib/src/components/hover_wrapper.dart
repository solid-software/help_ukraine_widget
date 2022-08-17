import 'package:flutter/material.dart';

/// A widget that calls callbacks in response to pointer events
class HoverWrapper extends StatefulWidget {
  /// A callback that reports for the value changes.
  final ValueChanged<bool>? onHoverChanged;

  /// A property of the widget.
  final Widget child;

  /// A tap callback for the button.
  final VoidCallback? onTap;

  /// A direct button bacground color.
  final Color? backgroundColor;

  /// A direct button highlight hover color.
  final Color? highlightColor;

  ///Constructor
  const HoverWrapper({
    Key? key,
    required this.child,
    this.onHoverChanged,
    this.onTap,
    this.backgroundColor,
    this.highlightColor,
  }) : super(key: key);

  @override
  State<HoverWrapper> createState() => _HoverWrapperState();
}

class _HoverWrapperState extends State<HoverWrapper> {
  bool _isHovered = false;

  void _onEnter() {
    setState(() => _isHovered = true);
    widget.onHoverChanged?.call(_isHovered);
  }

  void _onExit() {
    setState(() => _isHovered = false);
    widget.onHoverChanged?.call(_isHovered);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _onEnter(),
      onExit: (_) => _onExit(),
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          color: _isHovered ? widget.highlightColor : widget.backgroundColor,
          child: widget.child,
        ),
      ),
    );
  }
}
