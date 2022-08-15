import 'package:flutter/material.dart';

import 'package:help_ukraine_widget_example/storybook/stories/stories.dart';
import 'package:widgetbook/widgetbook.dart';

/// Direct widgets gallery
class StoryBook extends StatelessWidget {
  const StoryBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      appInfo: AppInfo(name: 'Help Ukraine Widget'),
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ThemeData.light(),
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: ThemeData.dark(),
        ),
      ],
      categories: [
        WidgetbookCategory(
          name: 'Components',
          widgets: [
            helpOptionButtonStory,
            helpOptionsListStory,
            cardRoundedStory,
          ],
        ),
        WidgetbookCategory(
          name: 'Examples',
          widgets: [
            // actionButtonComponent,
            // actionsListComponent,
          ],
        )
      ],
    );
    // return FlutterBook(
    //   categories: [
    //     Category(
    //       categoryName: 'Library',
    //       organizers: [
    //         Folder(
    //           folderName: 'Components',
    //           organizers: [
    //             Component(
    //               componentName: 'ActionButton',
    //               states: [
    //                 actionButtonStoryState,
    //               ],
    //             ),
    //             Component(
    //               componentName: 'ActionsList',
    //               states: [
    //                 actionsListStoryState,
    //               ],
    //             ),
    //             Component(
    //               componentName: 'Card',
    //               states: [
    //                 cardStoryState,
    //               ],
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ],
    // );
  }
}
