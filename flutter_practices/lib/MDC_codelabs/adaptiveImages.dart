import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Adaptiveimages extends StatelessWidget {
  Adaptiveimages(String url, {super.key}) {
    if (kIsWeb) {
      _url = Uri.parse(url)
          .replace(host: 'localhost', port: 8080, scheme: 'http')
          .toString();
    } else {
      _url = url;
    }
  }

  late final String _url;

  @override
  Widget build(BuildContext context) {
    return Image.network(_url);
  }
}
