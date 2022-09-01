import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:widgetbook/widgetbook.dart';

final _backgroundColor = Colors.grey.withOpacity(0.5);

/// Test height.
const testHeight = 420.0;

/// Test width
const testWidth = 420.0;

const _listLength = 100;

/// Definition of using 4 different widget inherited from [HelpWidget].
WidgetbookComponent get helpWidgetStory => WidgetbookComponent(
      name: 'HelpWidget',
      useCases: [
        WidgetbookUseCase(
          name: 'First',
          builder: (context) {
            final alignmentX = context.knobs.slider(
              label: 'Alignment on x Axis',
              initialValue: -1,
              min: -1,
              max: 1,
            );

            final alignmentY = context.knobs.slider(
              label: 'Alignment on y Axis',
              initialValue: -1,
              min: -1,
              max: 1,
            );

            final _alignment = Alignment(alignmentX, alignmentY);

            return Container(
              alignment: Alignment.center,
              color: _backgroundColor,
              child: CardRounded(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.black,
                height: testHeight,
                width: testWidth,
                child: OverlayWidget(
                  alignment: _alignment,
                  overlayWidget: HorizontalHelpWidget(
                    alignment: _alignment,
                  ),
                  child: ListView(
                    children: [
                      for (var i = 0; i < _listLength; i++)
                        Text(
                          i.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
