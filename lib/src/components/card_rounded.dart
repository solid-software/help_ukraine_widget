import 'package:flutter/material.dart';

import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/components/hover_wrapper.dart';

/// This is a card widget with a rounded border, that has optional close button
/// at the top right.
class CardRounded extends StatelessWidget {
  /// A child widget for [Card].
  final Widget? child;

  /// The background color of the card.
  final Color? backgroundColor;

  /// A variable that sets the height of the card.
  final double? height;

  /// A variable that sets the width of the card.
  final double? width;

  /// A variable that sets the padding of the card.
  final EdgeInsets? padding;

  /// Action to perform when the "Close" button is tapped.
  ///
  /// Note that the "Close" button appears only when this variable is set
  /// to a non-null value.
  final VoidCallback? onClose;

  /// A variable that sets the position of the close button.
  ///
  /// Note that currently card accepts only 2 types of Alignment:
  /// Alignment.topRight and Alignment.bottomRight
  final Alignment closeButtonAlignment;

  /// A variable that sets the icon of the close button.
  final IconData? customButtonIcon;

  static const _elevation = 4.0;
  static const _borderRadius = 13.0;

  static const _defaultOffset = -5.0;

  ///Constructor
  const CardRounded({
    Key? key,
    this.child,
    this.backgroundColor,
    this.height,
    this.width,
    this.onClose,
    this.closeButtonAlignment = Alignment.topRight,
    this.customButtonIcon,
    this.padding,
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
        padding: padding ??
            const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
        child: child,
      ),
    );

    if (onClose != null) {
      if (closeButtonAlignment == Alignment.topRight) {
        _closeButton = Positioned(
          right: _defaultOffset,
          top: _defaultOffset,
          child: _CloseButton(onTap: onClose, iconData: customButtonIcon),
        );
      } else if (closeButtonAlignment == Alignment.bottomRight) {
        _closeButton = Positioned(
          right: _defaultOffset,
          bottom: _defaultOffset,
          child: _CloseButton(onTap: onClose, iconData: customButtonIcon),
        );
      } else {
        throw Exception(
          'Card supports only Alignment.topRight and Alignment.bottomRight',
        );
      }
    } else {
      _closeButton = const SizedBox();
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [card, _closeButton],
    );
  }
}

class _CloseButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData? iconData;

  const _CloseButton({Key? key, this.onTap, this.iconData}) : super(key: key);

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
        backgroundColor: Colors.black87,
        highlightColor: Colors.blue,
        onTap: onTap,
        child: Icon(
          iconData ?? Icons.close,
          size: _iconSize,
          color: Colors.white,
        ),
      ),
    );
  }
}
