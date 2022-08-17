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

  /// It's a builder a function type for main card of widget.
  final MainCardBuilder mainCardBuilder;

  /// It's a builder a function type for options card of widget.
  final OptionsBuilder optionsCardBuilder;

  /// It's a parameter that defines the maximum width of the widget.
  final BoxConstraints? constraints;

  ///Constructor
  const HelpWidget({
    Key? key,
    this.axis = Axis.vertical,
    required this.mainCardBuilder,
    required this.options,
    required this.optionsCardBuilder, this.constraints,
    // required this.controller,
  }) : super(key: key);

  @override
  State<HelpWidget> createState() => _HelpWidgetState();
}

class _HelpWidgetState extends State<HelpWidget> {
  bool _isPositiveDirection = false;

  Widget? _switchWidget;

  Widget? _mainCardWidget;
  Widget? _flagCardWidget;
  Widget? _optionsCardWidget;

  _MainBuilderController _mainBuilderController() {
    final controller = _MainBuilderController();
    controller.onClose = () {
      _isPositiveDirection = false;
      setState(() => _switchWidget = _flagCardWidget);
    };
    controller.onDetails = () {
      _isPositiveDirection = true;
      setState(() => _switchWidget = _optionsCardWidget);
    };

    return controller;
  }

  _OptionsBuilderController _optionsBuilderController() {
    final controller = _OptionsBuilderController();
    controller.options = widget.options;
    controller.onClose = () {
      _isPositiveDirection = false;
      setState(() {
        _switchWidget = _mainCardWidget;
      });
    };

    return controller;
  }

  void _onFlag() {
    _isPositiveDirection = true;
    setState(() {
      _switchWidget = _mainCardWidget;
    });
  }

  @override
  void initState() {
    super.initState();

    _flagCardWidget = const _FlagCard();
    _switchWidget = _flagCardWidget;

    _mainCardWidget = widget.mainCardBuilder(_mainBuilderController());

    _optionsCardWidget = widget.optionsCardBuilder(_optionsBuilderController());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: widget.constraints,
      child: GestureDetector(
        onTap: _switchWidget == _flagCardWidget ? _onFlag : null,
        behavior: HitTestBehavior.opaque,
        child: _AnimationBuilder(
          axis: widget.axis,
          isPositiveDirection: _isPositiveDirection,
          child: _switchWidget,
        ),
      ),
    );
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
