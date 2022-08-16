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

  void _onHoverCallback(bool value) => widget.onHoverChanged?.call(value);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => _isHovered = true);
        _onHoverCallback(_isHovered);
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _onHoverCallback(_isHovered);
      },
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
