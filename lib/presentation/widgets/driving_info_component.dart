import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/fonts.dart';
import '../../core/utils/icons.dart';
import '../viewmodels/driving/driving_view_model.dart';
import '../viewmodels/driving/location_view_model.dart';

class DrivingInfo extends StatelessWidget {
  const DrivingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.watch<DrivingViewModel>().drivingState ==
        DrivingState.BluetoothDisconnect) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.gray100,
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
          border: Border.all(
            color: AppColor.gray100,
            width: 1,
          ),
        ),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcon.moon(color: AppColor.gray500),
                Text(
                  '블루투스 연결해주세요',
                  style: AppTypography.body2R.copyWith(
                    color: AppColor.gray500,
                  ),
                )
              ],
            ),
            AppIcon.defaultCar(color: AppColor.gray700),
            Text(
              textAlign: TextAlign.center,
              '블루투스가 연결되지\n않았습니다',
              style: AppTypography.title2B.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColor.gray700,
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcon.speed(
                  width: 36,
                  height: 36,
                ),
                Text(
                  "${context.watch<LocationViewModel>().totalDistance.toStringAsFixed(2)}km",
                  style: AppTypography.title3B,
                )
              ],
            )
          ],
        ),
      );
    } else if (context.watch<DrivingViewModel>().drivingState ==
        DrivingState.Off) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.main100,
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
          border: Border.all(
            color: AppColor.gray100,
            width: 1,
          ),
        ),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcon.moon(
                  color: AppColor.main400,
                ),
                Text(
                  '졸음 운전 감지 준비 완료!!!',
                  style: AppTypography.body2R.copyWith(
                    color: AppColor.main400,
                  ),
                )
              ],
            ),
            AppIcon.defaultCar(color: AppColor.main),
            Text(
              textAlign: TextAlign.center,
              '블루투스 연결됨',
              style: AppTypography.title2B.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColor.main,
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcon.speed(
                  width: 36,
                  height: 36,
                ),
                Text(
                  "${context.watch<LocationViewModel>().totalDistance.toStringAsFixed(2)}km",
                  style: AppTypography.title3B,
                )
              ],
            )
          ],
        ),
      );
    } else if (context.watch<DrivingViewModel>().drivingState ==
        DrivingState.On) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.main100,
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
          border: Border.all(
            color: AppColor.gray100,
            width: 1,
          ),
        ),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcon.moon(
                  color: AppColor.main400,
                ),
                Text(
                  '졸음 운전 감지 중',
                  style: AppTypography.body2R.copyWith(
                    color: AppColor.main400,
                  ),
                )
              ],
            ),
            AppIcon.defaultCar(color: AppColor.main),
            Text(
              textAlign: TextAlign.center,
              '운전 중',
              style: AppTypography.title2B.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColor.main,
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcon.speed(
                  width: 36,
                  height: 36,
                ),
                Text(
                  "${context.watch<LocationViewModel>().totalDistance.toStringAsFixed(2)}km",
                  style: AppTypography.title3B,
                )
              ],
            )
          ],
        ),
      );
    } else if (context.watch<DrivingViewModel>().drivingState ==
        DrivingState.Pause) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.main100,
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
          border: Border.all(
            color: AppColor.gray100,
            width: 1,
          ),
        ),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcon.moon(
                  color: AppColor.main400,
                ),
                Text(
                  '졸음 운전 감지 중',
                  style: AppTypography.body2R.copyWith(
                    color: AppColor.main400,
                  ),
                )
              ],
            ),
            AppIcon.defaultCar(color: AppColor.error),
            Text(
              textAlign: TextAlign.center,
              '운전 멈춤',
              style: AppTypography.title2B.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColor.error,
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcon.speed(
                  width: 36,
                  height: 36,
                ),
                Text(
                  "${context.watch<LocationViewModel>().totalDistance.toStringAsFixed(2)}km",
                  style: AppTypography.title3B,
                )
              ],
            )
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.error,
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
          border: Border.all(
            color: AppColor.gray100,
            width: 1,
          ),
        ),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcon.moon(
                  color: AppColor.error,
                ),
                Text(
                  'Error',
                  style: AppTypography.body2R.copyWith(
                    color: AppColor.error,
                  ),
                )
              ],
            ),
            AppIcon.defaultCar(color: AppColor.main),
            Text(
              textAlign: TextAlign.center,
              'Error',
              style: AppTypography.title2B.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColor.error,
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcon.speed(
                  width: 36,
                  height: 36,
                ),
                Text(
                  "${context.watch<LocationViewModel>().totalDistance.toStringAsFixed(2)}km",
                  style: AppTypography.title3B,
                )
              ],
            )
          ],
        ),
      );
    }
  }
}
