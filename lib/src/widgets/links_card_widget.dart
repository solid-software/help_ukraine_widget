import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

import 'package:help_ukraine_widget/help_ukraine_widget.dart';

class LinksCardWidget extends StatefulWidget {
  final List<HelpOptionButton> options;
  final VoidCallback onHidePressed;

  const LinksCardWidget({
    Key? key,
    required this.options,
    required this.onHidePressed,
  }) : super(key: key);

  @override
  State<LinksCardWidget> createState() => _LinksCardWidgetState();
}

class _LinksCardWidgetState extends State<LinksCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: widget.options,
        ),
        const Divider(height: 20),
        _LinksCardButton(onTap: widget.onHidePressed),
      ],
    );
  }
}

class _LinksCardButton extends StatefulWidget {
  final VoidCallback onTap;

  const _LinksCardButton({Key? key, required this.onTap}) : super(key: key);

  @override
  State<_LinksCardButton> createState() => _LinksCardButtonState();
}

class _LinksCardButtonState extends State<_LinksCardButton> {
  bool _isHovered = false;

  void _onHoverChanged(bool value) {
    setState(() {
      _isHovered = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).textTheme.bodyText1?.color;

    return HoverWrapper(
      onHoverChanged: _onHoverChanged,
      onTap: widget.onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hide',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: _isHovered ? Colors.blue : color,
                ),
          ),
          Icon(
            SFSymbols.chevron_up,
            color: _isHovered ? Colors.blue : color,
          ),
        ],
      ),
    );
  }
}
