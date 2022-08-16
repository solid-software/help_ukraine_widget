import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

class ThirdHelpWidget extends StatelessWidget {
  ///Constructor
  const ThirdHelpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HelpWidget(
      axis: Axis.horizontal,
      mainCardTitle: 'Stop War!',
      mainCardDescription: 'Help Ukraine!',
      options: defaultOptionsList,
      optionsCardBuilder: (options, onClose) {
        return CardRounded(
          customButtonIcon: SFSymbols.chevron_left,
          onClose: onClose,
          closeButtonAlignment: Alignment.bottomRight,
          key: const ValueKey(2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: options,
          ),
        );
      },
      mainCardBuilder: (flag, title, desc, onDetails, onClose) {
        return CardRounded(
          key: const ValueKey(1),
          onClose: onClose,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent,
                    ),
              ),
              if (desc != null)
                Text(
                  desc,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.yellow,
                      ),
                ),
              const SizedBox(height: 15),
              _ActionButton(onTap: onDetails),
            ],
          ),
        );
      },
    );
  }
}

class _ActionButton extends StatefulWidget {
  final VoidCallback onTap;

  static const _width = 135.0;
  static const _height = 40.0;

  static const _borderRadius = 13.0;

  static const _fontSize = 18.0;
  static const _iconSize = 15.0;

  const _ActionButton({Key? key, required this.onTap}) : super(key: key);

  @override
  State<_ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<_ActionButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final color = Colors.blueAccent.withOpacity(0.2);

    return HoverWrapper(
      onHoverChanged: (value) {
        setState(() => _isHovered = value);
      },
      onTap: widget.onTap,
      child: Container(
        height: _ActionButton._height,
        width: _ActionButton._width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_ActionButton._borderRadius),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'See how',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Colors.blueAccent,
                    fontSize: _ActionButton._fontSize,
                    decoration: _isHovered ? TextDecoration.underline : null,
                  ),
            ),
            const Icon(
              SFSymbols.chevron_right,
              size: _ActionButton._iconSize,
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
