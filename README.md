# Help Ukraine Widget for Flutter

[![style: solid](https://img.shields.io/badge/style-solid-orange)](https://pub.dev/packages/solid_lints)

This is a port of [Help Ukraine Widget](https://helpukrainewinwidget.org/) -
this widget helps to let users of your app know how they can help Ukraine
from anywhere in the world.

## Showcase

<details open><summary>First widget variation</summary>

![First widget example](gifs/widget1.gif)
</details>

<details><summary>Second widget variation</summary>
    
![Second widget example](gifs/widget2.gif)
</details>

<details><summary>Third widget variation</summary>

![Third widget example](gifs/widget3.gif)
</details>

<details><summary>Fourth widget variation</summary>

![Fourth widget example](gifs/widget4.gif)
</details>

## Features

By installing this widget in your app, you will help to end the war in Ukraine.
It will provide links for:

* [donations](https://uahelp.monobank.ua/),
* sharing this widget
* and [other ways to support Ukraine](https://war.ukraine.ua/).

## Getting started

Add the package as a dependency to your __pubspec.yaml__:

``` yaml
dependencies:
    help_ukraine_widget: <latest version>
```

in your code:

``` dart
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
```

## Usage

### Basic usage

Use `OverlayWidget` to float and align the widget above your app:

``` dart
OverlayWidget(
    alignment: Alignment.bottomRight,
    overlayWidget: HorizontalHelpWidget(),
    child: MyApp(),
)
```

### Customization

You can also create custom variations of this widget:

``` dart
// we used that in our widget, but you do you 
final order = [HelpWidgetView.collapsed, HelpWidgetView.main, HelpWidgetView.options];

final _controller = TraverseController(order);

HelpWidget(
    controller: _controller;
    // view with links to resources that help Ukraine
    optionsView: ...
    // The default first view that the users see.
    mainView: ...
    // smallest view that doesn't obstruct user from
    // using the app, but still exists on the screen
    collapsedView: ...
    // axis of transition animation between views
    axis: ...
)
```

## Credits

[jiffsy.co](https://jiffsy.co/) and [Gearheart](https://gearheart.io/) for designing and creating the [original widget](https://helpukrainewinwidget.org/).
