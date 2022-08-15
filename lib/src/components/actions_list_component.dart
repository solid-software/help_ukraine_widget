import 'package:flutter/material.dart';

import 'package:help_ukraine_widget/src/components/action_button_component.dart';

class ActionsListItem {
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
  const ActionsListComponent({Key? key, required this.actions})
      : super(key: key);

  final List<ActionsListItem> actions;

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
        );
      },
    );
  }
}
