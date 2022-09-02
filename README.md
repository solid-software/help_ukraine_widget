# Help Ukraine Widget for Flutter
This is a port of [Help Ukraine Widget](https://helpukrainewinwidget.org/) -
this widget helps to let users of your app know how they can help Ukraine
from anywhere in the world.

### Some examples

<details open><summary>First widget variation</summary>

![](gifs/widget1.gif)
</details>

<details><summary>Second widget variation</summary>
    
![](gifs/widget2.gif)
</details>

<details><summary>Third widget variation</summary>

![](gifs/widget3.gif)
</details>

<details><summary>Fourth widget variation</summary>

![](gifs/widget4.gif)
</details>

## Features
By installing this widget in your app, you will help to end the war in Ukraine.
It will provide links for:

* [donations](https://uahelp.monobank.ua/),
* sharing this widget
* and [other ways to support Ukraine](https://war.ukraine.ua/).

## Getting started
<h5 a><strong><code>pubspec.yaml</code></strong></h5>

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
`HorizontalHelpWidget()`

### Customization
You can add widget floating above your app like that:
```
OverlayWidget(
    alignment: alignment,
    overlayWidget: HorizontalHelpWidget(),
    child: MyApp(),
)
```
