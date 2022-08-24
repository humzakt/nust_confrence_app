import 'package:url_launcher/url_launcher.dart';

void navigateTo() async {
  String location = 'NUST GATE 1';
  var uri =
      Uri.parse("https://www.google.com/maps/search/?api=1&query=$location");

  try {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  } catch (e) {
    print(e);
  }
}
