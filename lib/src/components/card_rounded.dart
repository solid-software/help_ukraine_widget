import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

import 'package:help_ukraine_widget/help_ukraine_widget.dart';

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

  /// A padding for the cards content.
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

  static const _defaultOffset = 5.0;

  ///Constructor
  const CardRounded({
    Key? key,
    this.child,
    this.backgroundColor,
    this.height,
    this.width,
    this.onClose,
    this.closeButtonAlignment = Alignment.topRight,
    this.customButtonIcon = SFSymbols.xmark,
    this.padding = const EdgeInsets.symmetric(
      vertical: 12,
      horizontal: 12,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget _positionedButton;

    final card = Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
      final button = _CloseButton(onTap: onClose, iconData: customButtonIcon);

      _positionedButton = Positioned(
        right: _defaultOffset,
        top: closeButtonAlignment == Alignment.topRight ? _defaultOffset : null,
        bottom: closeButtonAlignment == Alignment.bottomRight
            ? _defaultOffset
            : null,
        child: button,
      );
    } else {
      _positionedButton = const SizedBox();
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [card, _positionedButton],
    );
  }
}

class _CloseButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData? iconData;

  const _CloseButton({
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
