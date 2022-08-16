import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

class HelpWidget extends StatefulWidget {
  final Axis axis;

  final String mainCardTitle;
  final String? mainCardDescription;

  final List<HelpOptionButton> options;

  final Widget Function(
    Widget flag,
    String title,
    String? description,
    VoidCallback onDetailsCallback,
    VoidCallback onClose,
  ) mainCardBuilder;

  final Widget Function(
    List<HelpOptionButton>,
    VoidCallback onClose,
  ) optionsCardBuilder;

  ///Constructor
  const HelpWidget({
    Key? key,
    this.axis = Axis.vertical,
    required this.mainCardBuilder,
    required this.mainCardTitle,
    required this.options,
    required this.optionsCardBuilder,
    this.mainCardDescription,
    // this.type = HelpWidgetType.one,
    // this.position = Alignment.bottomLeft,
  }) : super(key: key);

  @override
  State<HelpWidget> createState() => _HelpWidgetState();
}

class _HelpWidgetState extends State<HelpWidget> {
  bool _isPositiveDirection = false;

  Widget? _mainCardWidget;
  Widget? _flagWidget;
  Widget? _switchWidget;
  Widget? _optionsWidget;

  void _onClose() {
    setState(() {
      _switchWidget = _flagWidget;
    });
  }

  void _onFlagWidgetPressed() {
    _isPositiveDirection = true;
    setState(() {
      _switchWidget = _mainCardWidget;
    });
  }

  void _onDetailsPressed() {
    _isPositiveDirection = true;
    setState(() {
      _switchWidget = _optionsWidget;
    });
  }

  void _onHidePressed() {
    _isPositiveDirection = false;
    setState(() {
      _switchWidget = _mainCardWidget;
    });
  }

  @override
  void initState() {
    super.initState();

    _flagWidget = const MouseRegion(
      key: ValueKey(0),
      cursor: SystemMouseCursors.click,
      child: CardRounded(
        child: _DefaultUkraineFlagWidget(),
      ),
    );

    _mainCardWidget = widget.mainCardBuilder(
      const _DefaultUkraineFlagWidget(),
      widget.mainCardTitle,
      widget.mainCardDescription,
      _onDetailsPressed,
      _onClose,
    );

    _optionsWidget = widget.optionsCardBuilder(widget.options, _onHidePressed);

    _switchWidget = _flagWidget;
  }

  Widget _layoutBuilder(Widget? currentChild, List<Widget> _) {
    return currentChild ?? const SizedBox();
  }

  Widget _transitionBuilder(Widget child, Animation<double> animation) {
    const padding = EdgeInsets.all(12.0);

    final _offsets = widget.axis == Axis.horizontal
        ? const [Offset(-0.5, 0.0), Offset(0.5, 0.0)]
        : const [Offset(0.0, -1.5), Offset(0.0, 1.5)];

    final inAnimation = Tween<Offset>(
      begin: _offsets.first,
      end: Offset.zero,
    ).animate(animation);

    final outAnimation = Tween<Offset>(
      begin: _offsets[1],
      end: Offset.zero,
    ).animate(animation);

    return child.key == const ValueKey(0) || !_isPositiveDirection
        ? SlideTransition(
            position: inAnimation,
            child: Padding(padding: padding, child: child),
          )
        : SlideTransition(
            position: outAnimation,
            child: Padding(padding: padding, child: child),
          );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _switchWidget == _flagWidget ? _onFlagWidgetPressed : null,
      behavior: HitTestBehavior.opaque,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        layoutBuilder: _layoutBuilder,
        transitionBuilder: _transitionBuilder,
        switchInCurve: Curves.fastOutSlowIn,
        switchOutCurve: Curves.fastOutSlowIn,
        child: _switchWidget,
      ),
    );
  }
}

class _DefaultUkraineFlagWidget extends StatelessWidget {
  const _DefaultUkraineFlagWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const size = 51.0;
    const borderRadius = 13.0;

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      clipBehavior: Clip.hardEdge,
      child: const FlagWidget(),
    );
  }
}
