import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_driving/presentation/viewmodels/main/bluetooth_view_model.dart';

import '../../core/utils/colors.dart';
import '../../core/utils/fonts.dart';
import '../../core/utils/icons.dart';

class DrivingInfo extends StatelessWidget {
  DrivingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BluetoothViewModel>(
      builder: (context, value, child) => Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        width: double.infinity,
        color: value.bluetooth ? AppColor.main100 : AppColor.gray100,
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            value.bluetooth
                ? Row(
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
                  )
                : Row(
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
            AppIcon.defaultCar(
                color: value.bluetooth ? AppColor.main : AppColor.gray700),
            value.bluetooth?  Text(
              textAlign: TextAlign.center,
              '운전 진행중',
              style: AppTypography.title2B.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColor.main,
              ),
            ):
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
                const Text(
                  '0km',
                  style: AppTypography.title3B,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
