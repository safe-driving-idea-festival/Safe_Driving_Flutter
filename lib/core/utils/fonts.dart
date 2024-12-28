import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 필요한 패키지 추가

class AppTypography {
  static const String _fontFamily = "S-Core Dream";

  // TextStyle을 const에서 제거하여, sp로 반응형 크기 설정
  static TextStyle title0 = TextStyle(
    fontSize: 32.sp, // 반응형 크기 적용
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamily,
  );
  static TextStyle title1 = TextStyle(
    fontSize: 30.sp, // 반응형 크기 적용
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamily,
  );
  static TextStyle title2B = TextStyle(
    fontSize: 24.sp, // 반응형 크기 적용
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamily,
  );
  static TextStyle title2R = TextStyle(
    fontSize: 24.sp, // 반응형 크기 적용
    fontWeight: FontWeight.w200,
    fontFamily: _fontFamily,
  );
  static TextStyle title3B = TextStyle(
    fontSize: 20.sp, // 반응형 크기 적용
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamily,
  );
  static TextStyle title3R = TextStyle(
    fontSize: 20.sp, // 반응형 크기 적용
    fontWeight: FontWeight.w200,
    fontFamily: _fontFamily,
  );
  static TextStyle body1B = TextStyle(
    fontSize: 18.sp, // 반응형 크기 적용
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
  );
  static TextStyle body1R = TextStyle(
    fontSize: 18.sp, // 반응형 크기 적용
    fontWeight: FontWeight.w200,
    fontFamily: _fontFamily,
  );
  static TextStyle body2B = TextStyle(
    fontSize: 16.sp, // 반응형 크기 적용
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
  );
  static TextStyle body2R = TextStyle(
    fontSize: 16.sp, // 반응형 크기 적용
    fontWeight: FontWeight.w200,
    fontFamily: _fontFamily,
  );
  static TextStyle caption1B = TextStyle(
    fontSize: 14.sp, // 반응형 크기 적용
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
  );
  static TextStyle caption1R = TextStyle(
    fontSize: 14.sp, // 반응형 크기 적용
    fontWeight: FontWeight.w200,
    fontFamily: _fontFamily,
  );
  static TextStyle caption2B = TextStyle(
    fontSize: 12.sp, // 반응형 크기 적용
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
  );
  static TextStyle caption2R = TextStyle(
    fontSize: 12.sp, // 반응형 크기 적용
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamily,
  );
  static TextStyle caption3B = TextStyle(
    fontSize: 10.sp, // 반응형 크기 적용
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
  );
  static TextStyle caption3R = TextStyle(
    fontSize: 10.sp, // 반응형 크기 적용
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamily,
  );
}