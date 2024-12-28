import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // .w, .h 사용을 위해 추가

import '../../core/utils/colors.dart';
import '../../core/utils/fonts.dart';
import '../../core/utils/icons.dart';

class ExitTagComponent extends StatelessWidget {
  const ExitTagComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 33.h, // 수정: .h 추가
      width: 94.w, // 수정: .w 추가
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.error,
          width: 1.w, // 수정: .w 추가
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(4.r), // 수정: .r 추가
        ),
      ),
      child: Row(
        spacing: 4.w,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcon.bar(
            color: AppColor.error,
            width: 16.w, // 수정: .w 추가
            height: 16.h, // 수정: .h 추가
          ),
          Text(
            '화면 이탈',
            style: AppTypography.caption1R.copyWith(
              color: AppColor.error,
            ),
          ),
        ],
      ),
    );
  }
}