/// A listing of available views of a single HelpUkraineWidget.
///
/// Helps to show different views
enum HelpWidgetView {
  /// A small, non-intrusive thumbnail view of the Widget.
  collapsed,

  /// View between [collapsed] and [options],
	/// shows thumbnail, title, link to [options]
	/// and a closing button that sets widget into [collapsed] mode.
  main,

  /// View with links.
  options,
}
