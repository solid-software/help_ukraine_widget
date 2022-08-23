import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/widgets/help_widget/help_widget_animation_builder.dart';

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

  final HelpWidgetViewController _controller;

  /// It's a parameter that defines the allowed size of the widget.
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
  })  : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewMap = {
      HelpWidgetView.collapsed: collapsedView,
      HelpWidgetView.main: mainView,
      HelpWidgetView.options: optionsView,
    };

    return Container(
      constraints: constraints,
      child: ValueListenableBuilder<HelpWidgetView>(
        valueListenable: _controller,
        builder: (context, view, _) {
          final isCurrentViewCollapsed = view == HelpWidgetView.collapsed;

          return GestureDetector(
            onTap: () {
              if (isCurrentViewCollapsed) {
                _controller.showMainView();
              }
            },
            child: HelpWidgetAnimationBuilder(
              axis: axis,
              transitionForward:
                  isCurrentViewCollapsed || !_controller.transitionForward,
              child: SizedBox(
                key: ValueKey(view),
                child: viewMap[view],
              ),
            ),
          );
        },
      ),
    );
  }
}
