import 'package:flutter/material.dart';

/// [ActionButtonComponent] uses for actions
class ActionButtonComponent extends StatelessWidget {
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

  static const _iconSize = 14.0;

  ///Constructor
  const ActionButtonComponent({
    Key? key,
    this.height = 51,
    required this.title,
    this.onTap,
    this.isExpandedCenter = false,
    required this.icon,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        onTap: onTap,
        child: Container(
          height: height,
          color: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (isExpandedCenter)
                const Spacer()
              else
                const SizedBox(width: 5),
              Icon(icon, size: _iconSize),
            ],
          ),
        ),
      ),
    );
  }
}
