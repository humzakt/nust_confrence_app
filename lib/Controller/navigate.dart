import 'package:url_launcher/url_launcher.dart';

void navigateTo({required double lat, required double lng}) async {
  var uri =
      Uri.parse("https://www.google.com/maps/search/?api=1&query=$lat%2C$lng");

  try {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  } catch (e) {
    print(e);
  }
}
