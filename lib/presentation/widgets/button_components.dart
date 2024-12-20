import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.child,
    required this.onTap,
  });

  final double width;
  final double height;
  final Color color;
  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(
        Radius.circular(4),
      ),
      color: color,
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          child: child,
        ),
      ),
    );
  }
}
