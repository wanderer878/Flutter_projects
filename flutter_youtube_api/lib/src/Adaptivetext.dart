import 'package:flutter/material.dart';

class Adaptivetext extends StatelessWidget {
  const Adaptivetext({super.key, required this.data, this.style});

  final String data;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return switch (Theme.of(context).platform) {
      TargetPlatform.android || TargetPlatform.iOS => Text(
          data,
          style: style,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      _ => SelectableText(
          data,
          style: style,
          maxLines: 1,
          //overflow: TextOverflow.ellipsis,
        )
    };
  }
}
