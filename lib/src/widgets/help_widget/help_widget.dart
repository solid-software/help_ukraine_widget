import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/widgets/help_widget/help_widget_animation_builder.dart';

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
            child: HelpWidgetAnimationBuilder(
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
