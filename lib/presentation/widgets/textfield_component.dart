import 'package:flutter/material.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/fonts.dart';

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
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        hintText: hintText,
        errorStyle: AppTypography.caption1R,
        errorMaxLines: 2,
        hintStyle: AppTypography.body2R.copyWith(color: AppColor.gray300),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          borderSide: BorderSide(
            color: AppColor.gray100,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          borderSide: BorderSide(
            color: AppColor.gray100,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          borderSide: BorderSide(
            color: AppColor.black,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          borderSide: BorderSide(
            color: AppColor.error, // 에러 상태 시 빨간 테두리
          ),
        ),
      ),
      validator: validator
    );
  }
}
