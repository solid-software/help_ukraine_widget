import 'package:flutter/material.dart';

/// Slide -in and -out animation
class HelpWidgetAnimationBuilder extends StatelessWidget {
  /// child for [SlideTransition]
  final Widget? child;

  /// animation axis
  final Axis axis;

  /// animation direction
  final bool isPositiveDirection;

  /// should be true if child is set to collapsed view
  final bool transitioningToCollapsed;

  /// constructor
  const HelpWidgetAnimationBuilder({
    Key? key,
    required this.child,
    required this.axis,
    required this.isPositiveDirection,
    required this.transitioningToCollapsed,
  }) : super(key: key);

  Animation<Offset> _slideAnimation(
    Animation<double> animation,
    int offsetIndex,
  ) {
    final _offset = axis == Axis.horizontal
        ? const [Offset(-0.5, 0.0), Offset(0.5, 0.0)]
        : const [Offset(0.0, -1.5), Offset(0.0, 1.5)];

    return Tween<Offset>(
      begin: _offset[offsetIndex],
      end: Offset.zero,
    ).animate(animation);
  }

  Animation<double> _fadeAnimation(Animation<double> animation) {
    const begin = 0.2;
    const end = 1.0;

    return Tween<double>(begin: begin, end: end).animate(animation);
  }

  Widget _layoutBuilder(Widget? currentChild, List<Widget> _) {
    return currentChild ?? const SizedBox();
  }

  Widget _transitionBuilder(Widget child, Animation<double> animation) {
    final inAnimation = _slideAnimation(animation, 0);

    final outAnimation = _slideAnimation(animation, 1);

    final fadeAnimation = _fadeAnimation(animation);

    const padding = EdgeInsets.all(12.0);

    final transition = FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(
        position: transitioningToCollapsed || !isPositiveDirection
            ? inAnimation
            : outAnimation,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );

    return transition;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      layoutBuilder: _layoutBuilder,
      transitionBuilder: _transitionBuilder,
      switchInCurve: Curves.fastOutSlowIn,
      switchOutCurve: Curves.fastOutSlowIn,
      child: child,
    );
  }
}
