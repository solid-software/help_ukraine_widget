import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
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
                        iconSize: 19,
                        child: Icon(
                          SFSymbols.money_dollar,
                          size: 19,
                        ),
                      ),
                      HelpOptionButton(
                        title: 'Support Ukraine',
                        iconSize: 19,
                        child: Icon(
                          SFSymbols.heart,
                          size: 19,
                        ),
                      ),
                      HelpOptionButton(
                        title: 'Share this widget',
                        iconSize: 19,
                        child: Icon(
                          SFSymbols.pin,
                          size: 19,
                        ),
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
