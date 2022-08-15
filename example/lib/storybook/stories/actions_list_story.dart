import 'package:flutterbook/flutterbook.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:ionicons/ionicons.dart';

ComponentState get actionsListStoryState => ComponentState(
      stateName: 'Default Actions List',
      markdown: 'some description',
      builder: (context, c) {
        return ActionsListComponent(
          actions: [
            ActionsListItem(
              title: 'Donate',
              icon: Ionicons.cash,
              isExpandedCenter: true,
              ontap: () {},
            ),
            ActionsListItem(
              title: 'Support Ukraine',
              icon: Ionicons.heart,
              isExpandedCenter: true,
              ontap: () {},
            ),
            ActionsListItem(
              title: 'Share this widget',
              icon: Ionicons.pin,
              isExpandedCenter: true,
              ontap: () {},
            ),
          ],
        );
      },
    );
