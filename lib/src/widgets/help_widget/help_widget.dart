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
    return Container(
      constraints: constraints,
      child: ValueListenableBuilder<HelpWidgetView>(
        valueListenable: _controller,
        builder: (context, view, _) {
          return GestureDetector(
            onTap: () {
              if (view == HelpWidgetView.collapsed) {
                _controller.showMainView();
              }
            },
            child: HelpWidgetAnimationBuilder(
              axis: axis,
              isPositiveDirection: _controller.isPositiveDirection,
              child: (() {
                if (view == HelpWidgetView.collapsed) {
                  return SizedBox(
                    key: const ValueKey(0),
                    child: collapsedView,
                  );
                }

                if (view == HelpWidgetView.main) {
                  return SizedBox(
                    key: const ValueKey(1),
                    child: mainView,
                  );
                }

                if (view == HelpWidgetView.options) {
                  return SizedBox(
                    key: const ValueKey(2),
                    child: optionsView,
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
