import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get cardRoundedStory => WidgetbookComponent(
      name: 'CardRounded',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) {
            final color = context.knobs.options(
              label: 'Color',
              options: const [
                Option(label: 'White', value: Colors.white),
                Option(label: 'Red', value: Colors.red),
                Option(label: 'Blue', value: Colors.blue),
              ],
            );

            final height = context.knobs.slider(
              label: 'Card Height',
              initialValue: 150,
              min: 150,
              max: 400,
            );

            final width = context.knobs.slider(
              label: 'Card Width',
              initialValue: 150,
              min: 150,
              max: 400,
            );

            final onClose = context.knobs
                    .boolean(label: 'With Close Button', initialValue: true)
                ? () {}
                : null;

            return Center(
              child: CardRounded(
                height: height,
                width: width,
                backgroundColor: color,
                onClose: onClose,
              ),
            );
          },
        ),
      ],
    );
