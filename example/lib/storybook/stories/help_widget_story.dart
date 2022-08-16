import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:widgetbook/widgetbook.dart';

///
WidgetbookComponent get helpWidgetStory => WidgetbookComponent(
      name: 'HelpWidget',
      useCases: [
        WidgetbookUseCase(
          name: 'First',
          builder: (context) {
            return const Center(
              child: FirstHelpWidget(),
            );
          },
        ),
        WidgetbookUseCase(
          name: 'Second',
          builder: (context) {
            return const Center(
              child: SecondHelpWidget(),
            );
          },
        ),
        WidgetbookUseCase(
          name: 'Third',
          builder: (context) {
            return const Center(
              child: ThirdHelpWidget(),
            );
          },
        ),
        WidgetbookUseCase(
          name: 'Fourth',
          builder: (context) {
            return const Center(
              child: FourthHelpWidget(),
            );
          },
        ),
      ],
    );
