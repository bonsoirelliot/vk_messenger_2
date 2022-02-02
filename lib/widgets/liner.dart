import 'package:flutter/material.dart';

class Liner extends StatelessWidget {
  const Liner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: Container(
        height: 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20,
          ),
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
