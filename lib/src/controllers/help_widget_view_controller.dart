import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// It's a controller that helps us choose the animation
/// direction and the current view
class HelpWidgetViewController extends ValueNotifier<HelpWidgetView> {
  /// A variable that helps choose animation direction.
  bool transitionForward = true;

  ///Constructor
  HelpWidgetViewController([
    super.value = HelpWidgetView.collapsed,
  ]);

  /// Defines logic to open CollapsedView
  void showCollapsedView() {
    _showView(HelpWidgetView.collapsed);
    notifyListeners();
  }

  /// Defines logic to open MainView
  void showMainView() {
    _showView(HelpWidgetView.main);
    notifyListeners();
  }

  /// Defines logic to open OptionsView
  void showOptionsView() {
    _showView(HelpWidgetView.options);
    notifyListeners();
  }

  void _showView(HelpWidgetView view) {
    transitionForward = _isTransitioningForward(value, view);
    value = view;
  }

  bool _isTransitioningForward(HelpWidgetView previous, HelpWidgetView next) {
    /// Transitioning from collapsed view to any other;
    final fromCollapsed = previous == HelpWidgetView.collapsed;

    /// Transitioning to options view, which should be the last one.
    final toOptions = next == HelpWidgetView.options;

    return fromCollapsed || toOptions;
  }

  void _updateTransitionDirection() {}
}
