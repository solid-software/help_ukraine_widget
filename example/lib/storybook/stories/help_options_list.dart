import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:widgetbook/widgetbook.dart';

///
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
                        icon: SFSymbols.money_dollar,
                        iconSize: 19,
                      ),
                      HelpOptionButton(
                        title: 'Support Ukraine',
                        icon: SFSymbols.heart,
                        iconSize: 19,
                      ),
                      HelpOptionButton(
                        title: 'Share this widget',
                        icon: SFSymbols.pin,
                        iconSize: 19,
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
