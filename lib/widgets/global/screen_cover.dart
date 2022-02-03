import 'package:flutter/material.dart';

class ScreenCover extends StatelessWidget {
  final Widget child;
  const ScreenCover({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      // child: SafeArea(
      //   left: false,
      //   right: false,
      //   bottom: false,
      //   child: child,
      // ),
      child: child,
    );
  }
}
