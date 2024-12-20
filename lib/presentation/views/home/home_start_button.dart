part of 'home_page.dart';

class _StartButton extends StatelessWidget {
  const _StartButton();

  @override
  Widget build(BuildContext context) {
    return ButtonComponent(
      onTap: () async{
        if (context.read<DrivingViewModel>().drivingState == DrivingState.Off) {
          await context.read<LocationViewModel>().initializeLocation();
          context.read<DrivingViewModel>().drivingOn();
          context.read<AbnormalBehaviorViewModel>().removeAbnormalBehaviorState();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (builder) => const DrivingPage()),
              (_) => false);
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) => const _HomeBluetoothConnectModal(),
          );
          Timer(const Duration(seconds: 1),
              () => context.read<DrivingViewModel>().bluetoothConnect());
        }
      },
      height: 70,
      width: 171,
      color: AppColor.main100,
      child: Text(
        '시작하기',
        style: AppTypography.title0.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColor.main,
        ),
      ),
    );
  }
}
