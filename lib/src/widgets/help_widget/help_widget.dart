import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/widgets/help_widget/animated_view_transition.dart';

/// It's a widget that displays a widget that can be collapsed, a widget that
/// can be expanded, and a widget that can be displayed when
/// the widget is expanded.
// class HelpWidget extends StatefullWidget {
class HelpWidget extends StatelessWidget {
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

  final TraverseController<HelpWidgetView> _controller;

  ///Constructor
  const HelpWidget({
    Key? key,
    required this.collapsedView,
    required this.optionsView,
    required this.mainView,
    required TraverseController<HelpWidgetView> controller,
    this.axis = Axis.vertical,
  })  : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewMap = {
      HelpWidgetView.collapsed: collapsedView,
      HelpWidgetView.main: mainView,
      HelpWidgetView.options: optionsView,
    };

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final view = _controller.currentItem;

        return AnimatedViewTransition(
          axis: axis,
          transitionForward: _controller.didTraverseForward,
          child: SizedBox(
            key: ValueKey(view),
            child: viewMap[view],
          ),
        );
      },
    );
  }
}
