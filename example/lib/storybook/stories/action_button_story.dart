import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:ionicons/ionicons.dart';

import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get actionButtonComponent => WidgetbookComponent(
      name: 'ActionButtonComponent',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) {
            final onTap = context.knobs
                    .boolean(label: 'Have Hover Effect', initialValue: true)
                ? () {}
                : null;

            final title = context.knobs.text(
              label: 'Button Title',
              initialValue: 'See what you can do',
            );

            final isExpandedCenter = context.knobs.boolean(
              label: 'Is expanded on center',
              initialValue: false,
            );

            final color = context.knobs.options(
              label: 'Color',
              options: const [
                Option(label: 'Grey', value: Colors.black12),
                Option(label: 'Red', value: Colors.red),
                Option(label: 'Blue', value: Colors.blue),
              ],
            );

            return Center(
              child: ActionButtonComponent(
                onTap: onTap,
                title: title,
                backgroundColor: color,
                isExpandedCenter: isExpandedCenter,
                icon: Ionicons.chevron_down,
              ),
            );
          },
        ),
      ],
    );
