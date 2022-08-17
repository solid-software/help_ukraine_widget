import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// A builder a function type for main card of widget.
typedef MainCardBuilder = Widget Function(_MainBuilderController);

/// A builder a function type for options card of widget.
typedef OptionsBuilder = Widget Function(_OptionsBuilderController);

class _MainBuilderController {
  VoidCallback onDetails = () {
    return;
  };
  VoidCallback onClose = () {
    return;
  };
}

class _OptionsBuilderController {
  VoidCallback onClose = () {
    return;
  };
  List<HelpOptionButton> options = [];
}

enum HelpWidgetView { collapsed, main, options }

class HelpWidgetViewController extends ValueNotifier<HelpWidgetView> {
  HelpWidgetViewController(super.value);

  void showOptions() {
    value = HelpWidgetView.options;
  }

  void goBack() {
    value = HelpWidgetView.main;
  }

  void close() {
    value = HelpWidgetView.collapsed;
  }
}

/// It's a widget that displays a flag, and when you click on it, it displays
/// a card with a title and a description, and when you click on the
/// description, it displays a card with a list of options.
///
/// Has a axis parameter to define direction of animation.
/// And has 2 builders [MainCardBuilder] and [OptionsBuilder] that you can
/// use to create your own [HelpWidget].
class HelpWidget extends StatefulWidget {
  /// A parameter that defines the direction of the animation.
  final Axis axis;

  /// It's a list of buttons that will be displayed in the options card.
  final List<HelpOptionButton> options;

  final Widget collapsedView;

  /// It's a builder a function type for main card of widget.
  final Widget mainView;

  /// It's a builder a function type for options card of widget.
  final Widget optionsView;

  final HelpWidgetViewController _controller;

  ///Constructor
  const HelpWidget({
    Key? key,
    this.axis = Axis.vertical,
    required this.collapsedView,
    required this.mainView,
    required this.options,
    required this.optionsView,
    required HelpWidgetViewController controller,
    // required this.controller,
  })  : _controller = controller,
        super(key: key);

  @override
  State<HelpWidget> createState() => _HelpWidgetState();
}

class _HelpWidgetState extends State<HelpWidget> {
  bool _isPositiveDirection = false;

  Widget? _switchWidget;

  Widget? _flagCardWidget;

  @override
  void initState() {
    super.initState();

    _flagCardWidget = const _FlagCard();

    _switchWidget = _flagCardWidget;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _switchWidget == _flagCardWidget ? _onFlag : null,
      behavior: HitTestBehavior.opaque,
      child: ValueListenableBuilder<HelpWidgetView>(
          valueListenable: widget._controller,
          builder: (context, view, _) {
            return _AnimationBuilder(
              axis: widget.axis,
              isPositiveDirection: _isPositiveDirection,
              child: ViewSwitcher(
                view: view,
                flagView: const _FlagCard(),
                mainView: widget.mainView,
                optionsView: widget.optionsView,
              ),
            );
          }),
    );
  }
}

class ViewSwitcher extends StatelessWidget {
  final HelpWidgetView view;
  final Widget flagView;
  final Widget mainView;
  final Widget optionsView;

  const ViewSwitcher({
    Key? key,
    required this.view,
    required this.flagView,
    required this.mainView,
    required this.optionsView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (view) {
      case HelpWidgetView.collapsed:
        return flagView;
      case HelpWidgetView.main:
        return mainView;
      case HelpWidgetView.options:
        return optionsView;
    }
  }
}

class _FlagCard extends StatelessWidget {
  const _FlagCard({Key key = const ValueKey(0)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MouseRegion(
      cursor: SystemMouseCursors.click,
      child: CardRounded(
        child: DefaultUkraineFlagWidget(),
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
