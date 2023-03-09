import 'package:url_launcher/url_launcher.dart';

launchURL() async {
  Uri url =
      Uri.parse('https://www.simplebooking.it/ibe/portal?pid=153&lang=EN');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

launchFBURL() async {
  Uri url = Uri.parse('https://www.facebook.com/weleadants');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

launchLinkedInURL() async {
  Uri url = Uri.parse('https://www.linkedin.com/company/chromahospitality/');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

launchIGURL() async {
  Uri url = Uri.parse('https://www.instagram.com/chromahospitality/');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
