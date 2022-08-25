import 'package:flutter/material.dart';

/// This controller allows to traverse a list one step at a time,
/// while retaining direction of last step ([didTraverseForward]).
class TraverseController<T> extends ChangeNotifier {
  /// list to traverse
  final List<T> order;
  int _currentItemIndex = 0;
  bool _didTraverseForward = true;

  /// Tells the direction of last step
  bool get didTraverseForward => _didTraverseForward;

  /// pointer to current item
  T get currentItem => order[_currentItemIndex];

  /// Constructor
  TraverseController(this.order, {T? startFrom}) : super() {
    _currentItemIndex = order.indexOf(startFrom ?? order.first);
  }

  /// go to next item (if possible),
  /// return value shows if operation was successful
  bool goForward() {
    return _traverse(true);
  }

  /// go to previous item (if possible),
  /// return value shows if operation was successful
  bool goBack() {
    return _traverse(false);
  }

  /// allows to check if goForward will be successful beforehand
  bool canGoForward() => _currentItemIndex + 1 < order.length;

  /// allows to check if goBack will be successful beforehand
  bool canGoBack() => _currentItemIndex > 0;

  bool _traverse(bool isForwardDirection) {
    final valueDiff = isForwardDirection ? 1 : -1;
    final canGo = isForwardDirection ? canGoForward : canGoBack;

    if (canGo()) {
      _didTraverseForward = isForwardDirection;
      _currentItemIndex += valueDiff;
      notifyListeners();

      return true;
    }

    return false;
  }
}
