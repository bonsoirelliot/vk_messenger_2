import 'package:flutter/material.dart';

class MaterialIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double size;
  const MaterialIconButton({
    required this.icon,
    required this.onPressed,
    this.size = 36,
    this.backgroundColor = Colors.transparent,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(90),
        child: Material(
          color: backgroundColor,
          child: SizedBox(
            height: size,
            width: size,
            child: IconButton(
              onPressed: onPressed,
              padding: EdgeInsets.zero,
              icon: icon,
            ),
          ),
        ),
      ),
    );
  }
}
