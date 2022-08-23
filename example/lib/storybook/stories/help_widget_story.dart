import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:widgetbook/widgetbook.dart';

final _backgroundColor = Colors.grey.withOpacity(0.5);

/// Definition of using 4 different widget inherited from [HelpWidget].
WidgetbookComponent get helpWidgetStory => WidgetbookComponent(
      name: 'HelpWidget',
      useCases: [
        WidgetbookUseCase(
          name: 'First',
          builder: (context) {
            return Container(
              alignment: Alignment.center,
              color: _backgroundColor,
              child: HorizontalHelpWidget(),
            );
          },
        ),
        WidgetbookUseCase(
          name: 'Fourth',
          builder: (context) {
            return Container(
              alignment: Alignment.center,
              color: _backgroundColor,
              child: EmbeddedFlagHelpWidget(),
            );
          },
        ),
      ],
    );
