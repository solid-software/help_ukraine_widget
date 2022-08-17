import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// [ThirdHelpWidget] is modification of a [HelpWidget] described as third type.
class ThirdHelpWidget extends StatelessWidget {
  /// A title of widget.
  final String title;

  ///A description for widget.
  final String description;

  static const _defaultTitle = 'Stop War!';
  static const _defaultDescription = 'Help Ukraine!';

  static const _widgetWidth = 320.0;

  ///Constructor
  const ThirdHelpWidget({
    Key? key,
    this.title = _defaultTitle,
    this.description = _defaultDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HelpWidget(
      constraints: const BoxConstraints(
        maxWidth: _widgetWidth,
      ),
      axis: Axis.horizontal,
      options: defaultOptionsList,
      optionsCardBuilder: (controller) {
        return CardRounded(
          customButtonIcon: SFSymbols.chevron_left,
          onClose: controller.onClose,
          closeButtonAlignment: Alignment.bottomRight,
          padding: const EdgeInsets.symmetric(vertical: 14),
          key: const ValueKey(2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: controller.options,
          ),
        );
      },
      mainCardBuilder: (controller) {
        return CardRounded(
          key: const ValueKey(1),
          onClose: controller.onClose,
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
              Text(
                description,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.yellow,
                    ),
              ),
              const SizedBox(height: 15),
              _ActionButton(onTap: controller.onDetails),
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
