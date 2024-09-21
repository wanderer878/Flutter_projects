import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Adaptiveimages extends StatelessWidget {
  Adaptiveimages(String url, {super.key}) {
    if (kIsWeb) {
      _url = Uri.parse(url)
          .replace(
              scheme: 'http', host: 'localhost', port: 8080, path: '/proxy')
          .replace(queryParameters: {'url': url}).toString();
    } else {
      _url = url;
    }
  }

  late final String _url;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      _url,
      errorBuilder: (context, error, stackTrace) => Text(error.toString()),
      fit: BoxFit.fill,
    );
  }
}
