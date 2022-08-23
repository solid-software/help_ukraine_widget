import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

import 'package:widgetbook/widgetbook.dart';

/// Definition of available states and customizable
/// parameters for [HelpOptionButton].
WidgetbookComponent get helpOptionButtonStory => WidgetbookComponent(
      name: 'HelpOptionButton',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) {
            final title = context.knobs.text(
              label: 'Button Title',
              initialValue: 'See what you can do',
            );

            final onTap = context.knobs
                    .boolean(label: 'Have Hover Effect', initialValue: true)
                ? () {}
                : null;

            final color = context.knobs.options(
              label: 'Color',
              options: const [
                Option(label: 'Grey', value: Colors.black12),
                Option(label: 'Red', value: Colors.red),
                Option(label: 'Blue', value: Colors.blue),
              ],
            );

            return Center(
              child: HelpOptionButton(
                onTap: onTap,
                title: title,
                backgroundColor: color,
                child: const Icon(
                  SFSymbols.chevron_down,
                  size: 14,
                ),
              ),
            );
          },
        ),
      ],
    );
