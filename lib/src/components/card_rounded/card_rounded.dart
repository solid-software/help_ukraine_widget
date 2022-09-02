import 'package:flutter/material.dart';

import 'package:help_ukraine_widget/src/components/card_rounded/close_button_card_rounded.dart';
import 'package:help_ukraine_widget/src/components/xmark.dart';

/// This is a card widget with a rounded border, that has optional close button
/// at the top right.
class CardRounded extends StatelessWidget {
  /// A child widget for [Card].
  final Widget? child;

  /// The background color of the card.
  final Color? backgroundColor;

  /// Height of the card.
  final double? height;

  /// Width of the card.
  final double? width;

  /// A padding for the cards content.
  final EdgeInsets? padding;

  /// Action to perform when the "Close" button is tapped.
  ///
  /// Note that the "Close" button appears only when this variable is set
  /// to a non-null value.
  final VoidCallback? onClose;

  /// Position of the close button.
  ///
  /// Note that currently card accepts only 2 types of Alignment:
  /// Alignment.topRight and Alignment.bottomRight
  final Alignment closeButtonAlignment;

  /// Icon for a close button
  final Widget? closeButtonIcon;

  /// Horizontal offset from right edge
  final double? right;

  /// Vertical offset from top edge
  final double? top;

  /// Vertical offset from bottom edge
  final double? bottom;

  static const _elevation = 4.0;
  static const _borderRadius = 12.8;

  static const _defaultOffset = 5.0;

  /// Constructor
  const CardRounded({
    Key? key,
    this.child,
    this.backgroundColor,
    this.height,
    this.width,
    this.onClose,
    this.closeButtonIcon,
    this.closeButtonAlignment = const Alignment(1, -1.05),
    this.padding = const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 10,
    ),
    this.right,
    this.top,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget _positionedCloseButton;

    final card = Container(
      margin: const EdgeInsets.symmetric(
        horizontal: _defaultOffset,
        vertical: _defaultOffset,
      ),
      child: Material(
        elevation: _elevation,
        borderRadius: BorderRadius.circular(_borderRadius),
        color: backgroundColor,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: height,
          width: width,
          padding: padding,
          child: child,
        ),
      ),
    );

    if (onClose != null) {
      const _iconSize = 10.0;
      const _padding = 6.4;
      const _lineWidth = 2.0;
      const _scale = 1.2;
      final _defaultCloseButtonIcon = Container(
        padding: const EdgeInsets.all(_padding),
        child: Transform.scale(
          scale: _scale,
          child: const XMark(
            size: Size.square(_iconSize),
            color: Colors.white,
            lineWidth: _lineWidth,
          ),
        ),
      );

      final button = CloseButtonCardRounded(
        onTap: onClose,
        child: closeButtonIcon ?? _defaultCloseButtonIcon,
      );
      _positionedCloseButton = Positioned(
        right: right,
        top: top,
        bottom: bottom,
        child: button,
      );
    } else {
      _positionedCloseButton = const SizedBox();
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [card, _positionedCloseButton],
    );
  }
}
