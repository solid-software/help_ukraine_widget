import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:widgetbook/widgetbook.dart';

/// Definition of using [HelpOptionButton].
WidgetbookComponent get helpOptionsListStory => WidgetbookComponent(
      name: 'HelpOptionsList',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) {
            return Column(
              children: [
                const SizedBox(height: 300),
                Expanded(
                  child: ListView(
                    children: const [
                      HelpOptionButton(
                        title: 'Donate',
                        child: Text("💸"),
                      ),
                      HelpOptionButton(
                        title: 'Support Ukraine',
                        child: Text("❤️"),
                      ),
                      HelpOptionButton(
                        title: 'Share this widget',
                        child: Text("📌"),
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
