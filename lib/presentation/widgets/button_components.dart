import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // ScreenUtil 추가

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
      borderRadius: BorderRadius.all(
        Radius.circular(4.r), // .r 추가
      ),
      color: color,
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: width.w, // .w 추가
          height: height.h, // .h 추가
          child: child,
        ),
      ),
    );
  }
}