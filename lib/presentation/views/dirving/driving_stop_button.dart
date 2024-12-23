part of 'driving_page.dart';

class _StopButton extends StatelessWidget {
  const _StopButton();

  @override
  Widget build(BuildContext context) {
    return ButtonComponent(
      width: double.infinity,
      height: 48,
      color: AppColor.main,
      onTap:
          context.read<DrivingViewModel>().drivingState == DrivingState.pause
              ? () {
                  context.read<DrivingViewModel>().drivingOn();
                  context.read<LocationViewModel>().startTracking();
                }
              : () => showDialog(
                    context: context,
                    builder: (builder) => const _StopModal(),
                  ),
      child: context.watch<DrivingViewModel>().drivingState ==
              DrivingState.pause
          ? Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcon.play(color: AppColor.white),
                Text(
                  '다시 운전하기',
                  style: AppTypography.body1R.copyWith(color: AppColor.white),
                ),
              ],
            )
          : Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcon.playDisable(color: AppColor.white),
                Text(
                  '잠시 멈추기',
                  style: AppTypography.body1R.copyWith(color: AppColor.white),
                ),
              ],
            ),
    );
  }
}
