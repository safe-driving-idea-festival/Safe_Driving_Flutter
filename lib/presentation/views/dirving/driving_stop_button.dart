part of 'driving_page.dart';

class _StopButton extends StatelessWidget {
  const _StopButton();

  @override
  Widget build(BuildContext context) {
    return ButtonComponent(
      width: double.infinity,
      height: 48.h,
      color: AppColor.main,
      onTap: context.read<DrivingViewModel>().drivingState == DrivingState.pause
          ? () {
              context
                  .read<DrivingViewModel>()
                  .drivingOn(context.read<AuthViewModel>().loginResponseModel!);
              context.read<LocationViewModel>().startTracking();
            }
          : () => showDialog(
                context: context,
                builder: (builder) => const _StopModal(),
              ),
      child: Row(
        spacing: 8.w,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcon.playDisable(color: AppColor.white),
          Text(
            '멈추기',
            style: AppTypography.body1R.copyWith(color: AppColor.white),
          ),
        ],
      ),
    );
  }
}
