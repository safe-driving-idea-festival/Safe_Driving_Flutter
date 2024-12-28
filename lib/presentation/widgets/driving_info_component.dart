import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // .w, .h 사용을 위해 추가
import '../../core/utils/colors.dart';
import '../../core/utils/fonts.dart';
import '../../core/utils/icons.dart';
import '../viewmodels/driving/driving_view_model.dart';
import '../viewmodels/driving/location_view_model.dart';

class DrivingInfo extends StatelessWidget {
  const DrivingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final drivingState = context.watch<DrivingViewModel>().drivingState;
    final distance = context.watch<LocationViewModel>().distanceModel?.distance.toStringAsFixed(2) ?? "0.00";

    Color getBackgroundColor() {
      switch (drivingState) {
        case DrivingState.off:
          return AppColor.gray100;
        case DrivingState.on:
        case DrivingState.pause:
          return AppColor.main100;
        default:
          return AppColor.error;
      }
    }

    String getTitle() {
      switch (drivingState) {
        case DrivingState.off:
          return '주행 준비중';
        case DrivingState.on:
          return '운전 중';
        case DrivingState.pause:
          return '운전 멈춤';
        default:
          return 'Error';
      }
    }

    Color getTitleColor() {
      switch (drivingState) {
        case DrivingState.off:
          return AppColor.gray700;
        case DrivingState.on:
          return AppColor.main;
        case DrivingState.pause:
          return AppColor.error;
        default:
          return AppColor.error;
      }
    }

    String getSubtitle() {
      switch (drivingState) {
        case DrivingState.off:
          return '주행을 준비중입니다';
        case DrivingState.on:
        case DrivingState.pause:
          return '졸음 운전 감지 중';
        default:
          return 'Error';
      }
    }

    Color getSubtitleColor() {
      switch (drivingState) {
        case DrivingState.off:
          return AppColor.gray500;
        case DrivingState.on:
        case DrivingState.pause:
          return AppColor.main400;
        default:
          return AppColor.error;
      }
    }

    Color getCarIconColor() {
      switch (drivingState) {
        case DrivingState.off:
          return AppColor.gray700;
        case DrivingState.on:
          return AppColor.main;
        case DrivingState.pause:
          return AppColor.error;
        default:
          return AppColor.main;
      }
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.h), // .h 추가
      width: double.infinity,
      decoration: BoxDecoration(
        color: getBackgroundColor(),
        borderRadius: BorderRadius.all(
          Radius.circular(4.r), // .r 추가
        ),
        border: Border.all(
          color: AppColor.gray100,
          width: 1.w, // .w 추가
        ),
      ),
      child: Column(
        spacing: 8.h,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            spacing: 12.w,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIcon.moon(color: getSubtitleColor()),
              Text(
                getSubtitle(),
                style: AppTypography.body2R.copyWith(
                  color: getSubtitleColor(),
                ),
              ),
            ],
          ),
          AppIcon.defaultCar(color: getCarIconColor()),
          Text(
            getTitle(),
            textAlign: TextAlign.center,
            style: AppTypography.title2B.copyWith(
              fontWeight: FontWeight.w600,
              color: getTitleColor(),
            ),
          ),
          SizedBox(height: 11.h),
          Row(
            spacing: 8.w,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIcon.speed(
                width: 36.w, // .w 추가
                height: 36.h, // .h 추가
              ),
              Text(
                "$distance km",
                style: AppTypography.title3B,
              ),
            ],
          ),
        ],
      ),
    );
  }
}