import 'package:flutter/material.dart';

import 'package:help_ukraine_widget/src/components/help_option_button.dart';

/// It's a class that represents an item in the list of actions
class HelpOptionsListItem {
  /// Constructor
  const HelpOptionsListItem({
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

class HelpOptionsList extends StatelessWidget {
  /// It's a list of [ActionsListItem] objects.
  final List<HelpOptionsListItem> actions;

  ///Constructor
  const HelpOptionsList({Key? key, required this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final action = actions[index];

        return HelpOptionButton(
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
