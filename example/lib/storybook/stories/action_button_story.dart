import 'package:flutter/material.dart';
import 'package:flutterbook/flutterbook.dart';

import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:ionicons/ionicons.dart';

/// A way to create a component state.
ComponentState get actionButtonStoryState => ComponentState(
      stateName: 'Default Action Button',
      builder: (context, c) {
        final onTap =
            c.boolean(label: 'Have Hover Effect', initial: true) ? () {} : null;

        final title =
            c.text(label: 'Button Title', initial: 'See what you can do');

        return ActionButtonComponent(
          onTap: onTap,
          title: title,
          icon: Ionicons.chevron_down,
        );
      },
    );
