import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// It's a widget that displays a widget that can be collapsed, a widget that
/// can be expanded, and a widget that can be displayed when
/// the widget is expanded.
class HelpWidget extends StatefulWidget {
  /// A parameter that defines the direction of the animation.
  final Axis axis;

  /// It's a parameter that defines the widget that will be displayed when
  /// the widget is collapsed.
  final Widget collapsedView;

  /// It's a parameter that defines the widget that will be displayed when
  /// the widget is on main view.
  final Widget mainView;

  /// It's a parameter that defines the widget that will be displayed when
  /// the widget is on options list view.
  final Widget optionsView;

  final HelpWidgetViewController _controller;

  /// It's a parameter that defines the maximum width of the widget.
  final BoxConstraints? constraints;

  ///Constructor
  const HelpWidget({
    Key? key,
    required this.collapsedView,
    required this.optionsView,
    required this.mainView,
    required HelpWidgetViewController controller,
    this.axis = Axis.vertical,
    this.constraints,
    // required this.controller,
  })  : _controller = controller,
        super(key: key);

  @override
  State<HelpWidget> createState() => _HelpWidgetState();
}

class _HelpWidgetState extends State<HelpWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: widget.constraints,
      child: ValueListenableBuilder<HelpWidgetView>(
        valueListenable: widget._controller,
        builder: (context, view, _) {
          return GestureDetector(
            onTap: () {
              if (view == HelpWidgetView.collapsed) {
                widget._controller.showMainView();
              }
            },
            child: _AnimationBuilder(
              axis: widget.axis,
              isPositiveDirection: widget._controller.isPositiveDirection,
              child: (() {
                if (view == HelpWidgetView.collapsed) {
                  return SizedBox(
                    key: const ValueKey(0),
                    child: widget.collapsedView,
                  );
                }

                if (view == HelpWidgetView.main) {
                  return SizedBox(
                    key: const ValueKey(1),
                    child: widget.mainView,
                  );
                }

                if (view == HelpWidgetView.options) {
                  return SizedBox(
                    key: const ValueKey(2),
                    child: widget.optionsView,
                  );
                }
              })(),
            ),
          );
        },
      ),
    );
  }
}

class _AnimationBuilder extends StatelessWidget {
  final Widget? child;

  final Axis axis;

  final bool isPositiveDirection;

  const _AnimationBuilder({
    Key? key,
    required this.child,
    required this.axis,
    required this.isPositiveDirection,
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

    final transition = FadeTransition(
      opacity: fadeAnimation,
      child: child.key == const ValueKey(0) || !isPositiveDirection
          ? _SlideTransition(inAnimation, child)
          : _SlideTransition(outAnimation, child),
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

class _SlideTransition extends StatelessWidget {
  final Animation<Offset> animation;
  final Widget child;

  const _SlideTransition(this.animation, this.child, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.all(12.0);

    return SlideTransition(
      position: animation,
      child: Padding(padding: padding, child: child),
    );
  }
}
