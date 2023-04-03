import 'package:url_launcher/url_launcher.dart';

class LaunchUrl {
  static launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
