import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// It's a stateless widget that takes in a card and returns a card
class CardComponent extends StatelessWidget {
  /// A child widget for [CardComponent].
  final Widget? child;

  /// A variable to set the background color of the card.
  final Color? backgroundColor;

  /// A variable that sets the height of the card.
  final double? height;

  /// A variable that sets the width of the card.
  final double? width;

  /// A variable that sets the close button on the card.
  final bool withCloseButton;

  /// A function that calls when close button pressed, if withCloseButton
  /// is false, it is necessary.
  final VoidCallback? onClose;

  static const _elevation = 4.0;
  static const _borderRadius = 13.0;

  ///Constructor
  const CardComponent({
    Key? key,
    this.child,
    this.backgroundColor,
    this.height,
    this.width,
    this.withCloseButton = false,
    this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget _closeButton;

    final card = Material(
      elevation: _elevation,
      borderRadius: BorderRadius.circular(_borderRadius),
      color: backgroundColor,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      ),
    );

    if (withCloseButton) {
      const offset = -5.0;
      _closeButton = Positioned(
        right: offset,
        top: offset,
        child: _CloseButton(onTap: onClose),
      );
    } else {
      _closeButton = const SizedBox();
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [card, _closeButton],
    );
  }
}

class _CloseButton extends StatefulWidget {
  final VoidCallback? onTap;

  const _CloseButton({Key? key, this.onTap}) : super(key: key);

  @override
  State<_CloseButton> createState() => _CloseButtonState();
}

class _CloseButtonState extends State<_CloseButton> {
  bool _isHover = false;

  static const _buttonSize = 20.0;

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
      child: Container(
        height: _buttonSize,
        width: _buttonSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _isHover ? Colors.blue : Colors.black87,
        ),
        child: const Icon(Icons.close, size: 10, color: Colors.white),
      ),
    );
  }
}
