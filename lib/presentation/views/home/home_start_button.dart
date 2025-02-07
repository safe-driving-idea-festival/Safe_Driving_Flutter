part of 'home_page.dart';

class _StartButton extends StatelessWidget {
  const _StartButton();

  @override
  Widget build(BuildContext context) {
    return ButtonComponent(
      onTap: () {
        context
            .read<DrivingViewModel>()
            .drivingOn(context.read<AuthViewModel>().loginResponseModel!);
        context.read<AbnormalBehaviorViewModel>().removeAbnormalBehaviorState();
        context.read<LocationViewModel>().startTracking();
        context.read<FcmController>().initAbnormalBehaviorViewModel(
            context.read<AbnormalBehaviorViewModel>());
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (builder) => const DrivingPage(),
            ),
            (_) => false);
      },
      height: 70.h,
      width: 171.w,
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
