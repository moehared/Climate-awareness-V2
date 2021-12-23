import 'package:url_launcher/url_launcher.dart';

Future<void> launchInBrowser(String url) async {
  //todo: check if the url is a youtube or article and based this either launch url or play video
  if (await canLaunch(url)) {
    await launch(
      url,
      forceWebView: true,
      forceSafariVC: true,
    );
  } else {
    throw 'Could not launch $url';
  }
}
