import 'package:flutter/material.dart';
import 'package:flutterbook/flutterbook.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:ionicons/ionicons.dart';

import 'stories/stories.dart';

/// Direct widgets gallery
class StoryBook extends StatelessWidget {
  const StoryBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterBook(
      categories: [
        Category(
          categoryName: 'Library',
          organizers: [
            Folder(
              folderName: 'Components',
              organizers: [
                Component(
                  componentName: 'ActionButton',
                  states: [
                    actionButtonStoryState,
                  ],
                ),
                Component(
                  componentName: 'ActionsList',
                  states: [
                    actionsListStoryState,
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
    // return MaterialApp(
    //   home: Scaffold(
    //     body: AdvancedStorybook(
    //       stories: [
    //         Story(
    //           key: 'Action Button',
    //           builder: (context) => const ActionButtonStory(),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
