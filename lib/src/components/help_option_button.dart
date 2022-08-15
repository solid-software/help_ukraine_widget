import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// [HelpOptionButton] uses for actions
class HelpOptionButton extends StatefulWidget {
  /// A variable that is used to set the height of the button.
  final double height;

  /// A variable that is used to set the title of the button.
  final String title;

  /// A callback for the button.
  final VoidCallback? onTap;

  /// Used to set the alignment of the button.
  final bool isExpandedCenter;

  /// A variable that is used to set the icon of the button.
  final IconData icon;

  /// A variable to set a bacground color for button;
  final Color? backgroundColor;

  /// A variable that is used to set the color of the button when the mouse is
  /// hovering over it.
  final Color? hoverColor;

  /// A variable that is used to set the size of the icon.
  final double iconSize;

  ///Constructor
  const HelpOptionButton({
    Key? key,
    this.height = 51,
    required this.title,
    this.onTap,
    this.isExpandedCenter = false,
    required this.icon,
    this.iconSize = 14,
    this.backgroundColor,
    this.hoverColor,
  }) : super(key: key);

  @override
  State<HelpOptionButton> createState() => _HelpOptionButtonState();
}

class _HelpOptionButtonState extends State<HelpOptionButton> {
  bool _isHovered = false;

  void _onEnter(PointerEnterEvent event) {
    setState(() => _isHover = true);
  }

  void _onExit(PointerExitEvent event) {
    setState(() => _isHover = false);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          color: _isHover
              ? widget.hoverColor ?? Theme.of(context).highlightColor
              : null,
          child: Container(
            height: widget.height,
            color: widget.backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (widget.isExpandedCenter)
                  const Spacer()
                else
                  const SizedBox(width: 5),
                Icon(widget.icon, size: widget.iconSize),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
