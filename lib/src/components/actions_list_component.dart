import 'package:flutter/material.dart';

import 'package:help_ukraine_widget/src/components/action_button_component.dart';

/// It's a class that represents an item in the list of actions
class ActionsListItem {
  /// Constructor
  const ActionsListItem({
    required this.title,
    required this.icon,
    this.ontap,
    this.isExpandedCenter = false,
    this.backgroundColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback? ontap;
  final bool isExpandedCenter;
  final Color? backgroundColor;
}

class ActionsListComponent extends StatelessWidget {
  /// It's a list of [ActionsListItem] objects.
  final List<ActionsListItem> actions;

  ///Constructor
  const ActionsListComponent({Key? key, required this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final action = actions[index];

        return ActionButtonComponent(
          title: action.title,
          icon: action.icon,
          onTap: action.ontap,
          isExpandedCenter: action.isExpandedCenter,
          backgroundColor: action.backgroundColor,
        );
      },
    );
  }
}
