import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_driving/core/utils/colors.dart';
import 'package:safe_driving/core/utils/fonts.dart';
import 'package:safe_driving/core/utils/icons.dart';
import 'package:safe_driving/presentation/viewmodels/main/bluetooth_view_model.dart';
import 'package:safe_driving/presentation/views/dirving/driving_page.dart';
import 'package:safe_driving/presentation/widgets/button_components.dart';

class BluetoothConnectModal extends StatelessWidget {
  const BluetoothConnectModal({super.key});

  @override
  Widget build(BuildContext context) {
    void navigator() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (builder) => const DrivingPage(),
        ),
      );
    }

    return Consumer<BluetoothViewModel>(
      builder: (context, value, child) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: 435,
          width: 343,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Column(
            spacing: 40,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: value.bluetooth ? AppColor.main : AppColor.gray700,
                  ),
                ),
                child: AppIcon.bluetoothSearching(
                  color: value.bluetooth ? AppColor.main : AppColor.gray700,
                ),
              ),
              value.bluetooth
                  ? Column(
                      spacing: 7,
                      children: [
                        const Text(
                          '연결에 성공했습니다',
                          style: AppTypography.title1,
                        ),
                        Text(
                          '확인 버튼을 클릭해주세요',
                          style: AppTypography.body2B.copyWith(
                            color: AppColor.gray500,
                          ),
                        )
                      ],
                    )
                  : Column(
                      spacing: 7,
                      children: [
                        const Text(
                          '연결 중입니다...',
                          style: AppTypography.title1,
                        ),
                        Text(
                          '블루투스 연결해주세요',
                          style: AppTypography.body2B.copyWith(
                            color: AppColor.gray500,
                          ),
                        )
                      ],
                    ),
              Column(
                spacing: 8,
                children: [
                  ButtonComponent(
                    onTap: value.bluetooth ? navigator : () {},
                    width: 255,
                    height: 46,
                    color: value.bluetooth ? AppColor.main : AppColor.gray300,
                    child: Text(
                      '확인',
                      style: AppTypography.body1R.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  ButtonComponent(
                    onTap: () => Navigator.pop(context),
                    width: 255,
                    height: 43,
                    color: AppColor.gray700,
                    child: Text(
                      '취소하기',
                      style: AppTypography.body1R.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
