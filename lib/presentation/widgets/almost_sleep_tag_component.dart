import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // ScreenUtil 추가

import '../../core/utils/colors.dart';
import '../../core/utils/fonts.dart';
import '../../core/utils/icons.dart';

class AlmostSleepTagComponent extends StatelessWidget {
  const AlmostSleepTagComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 63.w, // .w 추가
      height: 33.h, // .h 추가
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.error,
          width: 1.w, // .w 추가
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(4.r), // .r 추가
        ),
      ),
      child: Row(
        spacing: 4.w,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcon.bar(
            color: AppColor.error,
            width: 16.w, // .w 추가
            height: 16.h, // .h 추가
          ), Text(
            '졸음',
            style: AppTypography.caption1R.copyWith(
              color: AppColor.error,
            ),
          ),
        ],
      ),
    );
  }
}