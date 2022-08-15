import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:ionicons/ionicons.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get actionsListComponent => WidgetbookComponent(
      name: 'ActionsListComponent',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) {
            return Column(
              children: [
                const SizedBox(height: 300),
                Expanded(
                  child: ActionsListComponent(
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
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
