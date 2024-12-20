part of 'home_page.dart';

class _HomeBluetoothConnectModal extends StatelessWidget {
  const _HomeBluetoothConnectModal({super.key});

  @override
  Widget build(BuildContext context) {
    void navigator() async{
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (builder) => const DrivingPage(),
          ),
          (_) => false);
      await context.read<LocationViewModel>().initializeLocation();
      context.read<DrivingViewModel>().drivingOn();
      context.read<AbnormalBehaviorViewModel>().removeAbnormalBehaviorState();
    }

    return Consumer<DrivingViewModel>(
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
                    color: value.drivingState == DrivingState.Off
                        ? AppColor.main
                        : AppColor.gray700,
                  ),
                ),
                child: value.drivingState == DrivingState.Off
                    ? AppIcon.bluetooth(color: AppColor.main)
                    : AppIcon.bluetoothSearching(
                        color: AppColor.gray700,
                      ),
              ),
              value.drivingState == DrivingState.Off
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
                    onTap: value.drivingState == DrivingState.Off
                        ? navigator
                        : () {},
                    width: 255,
                    height: 46,
                    color: value.drivingState == DrivingState.Off
                        ? AppColor.main
                        : AppColor.gray300,
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
