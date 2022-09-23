import 'package:url_launcher/url_launcher_string.dart';

/// A default set of actions one could do to support Ukraine.
class HelpActions {
  /// A set of default actions.
  static const defaults = HelpActions(
    donateLink: "https://uahelp.monobank.ua/",
    supportLink: "https://war.ukraine.ua/",
    shareLink: "https://pub.dev/packages/help_ukraine_widget",
  );

  /// Link to a site with charity foundations.
  final String donateLink;

  /// Link to a site with more support options.
  final String supportLink;

  /// Link to this package public page.
  final String shareLink;

  /// Create a set of actions using custom links.
  const HelpActions({
    required this.donateLink,
    required this.supportLink,
    required this.shareLink,
  });

  /// Redirect the user to a site where they can donate
  /// to charities that support Ukraine.
  Future<void> donate() => launchUrlString(donateLink);

  /// Redirect the user to a site that lists more options to support Ukraine.
  Future<void> support() => launchUrlString(supportLink);

  /// Redirect the user to this package setup page.
  Future<void> share() => launchUrlString(shareLink);
}
