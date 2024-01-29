import 'package:flutter/cupertino.dart';

class MyWidget extends StatefulWidget {
  final Widget child;
  final bool isAnimating;
  final Duration duration;
  final VoidCallback? onEnd;
  final bool SmallLike;
  const MyWidget(
      {super.key,
      required this.child,
      required this.isAnimating,
      required this.duration,
      this.onEnd,
      required this.SmallLike});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.duration.inMilliseconds));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
