import 'package:flutter/material.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // .w, .h 사용을 위해 추가

class TextfieldComponent extends StatelessWidget {
  const TextfieldComponent({
    super.key,
    required this.hintText,
    required this.controller,
    required this.validator,
  });

  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColor.black,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w, // 수정: .w 추가
          vertical: 12.h,   // 수정: .h 추가
        ),
        hintText: hintText,
        errorStyle: AppTypography.caption1R,
        errorMaxLines: 2,
        hintStyle: AppTypography.body2R.copyWith(color: AppColor.gray300),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.r), // 수정: .r 추가
          ),
          borderSide: const BorderSide(
            color: AppColor.gray100,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.r), // 수정: .r 추가
          ),
          borderSide: const BorderSide(
            color: AppColor.gray100,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.r), // 수정: .r 추가
          ),
          borderSide: const BorderSide(
            color: AppColor.black,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.r), // 수정: .r 추가
          ),
          borderSide: const BorderSide(
            color: AppColor.error, // 에러 상태 시 빨간 테두리
          ),
        ),
      ),
      validator: validator,
    );
  }
}