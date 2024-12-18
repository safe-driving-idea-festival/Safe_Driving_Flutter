part of 'home_page.dart';

class _StartButton extends StatelessWidget {
  const _StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonComponent(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => BluetoothConnectModal(),
        );
        Timer(Duration(seconds: 10),
            () => context.read<BluetoothViewModel>().bluetoothConnect());
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
