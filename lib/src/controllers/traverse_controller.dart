import 'package:flutter/material.dart';

/// This controller allows to traverse a list one step at a time,
/// while retaining direction of last step ([didTraverseForward]).
/// [value] is pointer to current position in [order].
class TraverseController<T> extends ValueNotifier<int> {
	/// list to traverse
	final List<T> order;

	bool _didTraverseForward = true;

	/// Tells the direction of last step
	bool get didTraverseForward => _didTraverseForward;

	/// pointer to current item
	T get currentItem => order[value];

	/// Constructor
  TraverseController(this.order, [super.value = 0]);

	/// go to next item (if possible),
	/// return value shows if operation was successful
	bool goForward() => _traverse(true);

	/// go to previous item (if possible),
	/// return value shows if operation was successful
	bool goBack() => _traverse(false);

	/// allows to check if goForward will be successful beforehand
	bool canGoForward() => value + 1 < order.length;

	/// allows to check if goBack will be successful beforehand
	bool canGoBack() => value > 0;

	bool _traverse(bool isForwardDirection) {
		var valueDiff = -1;
		var canGo = canGoBack;
		if (isForwardDirection) {
			valueDiff = 1;
			canGo = canGoForward;
		}

		if (canGo()) {
			_didTraverseForward = isForwardDirection;
			value += valueDiff;
			notifyListeners();

			return true;
		}
		
		return false;
	}
}
