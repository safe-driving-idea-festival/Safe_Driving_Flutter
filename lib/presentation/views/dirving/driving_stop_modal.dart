part of 'driving_page.dart';

class _StopModal extends StatelessWidget {
  const _StopModal();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) => Dialog(
        insetPadding: const EdgeInsets.all(16),
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(16),
          height: 219,
          width: 343,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '운전을 멈추겠습니까?',
                    style: AppTypography.title2B,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: AppIcon.close(
                      width: 36,
                      height: 36,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '멈추기를 클릭 할 경우 연결이 해제됩니다',
                  style: AppTypography.body2R.copyWith(
                    color: AppColor.gray500,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 9,
                children: [
                  ButtonComponent(
                    width: 146,
                    height: 43,
                    color: AppColor.gray700,
                    child: Text(
                      '잠시 멈추기',
                      style: AppTypography.body2B.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                    onTap: () {
                      context.read<LocationViewModel>().stopTracking();
                      context.read<DrivingViewModel>().drivingPause();
                      Navigator.pop(context);
                    },
                  ),
                  ButtonComponent(
                    width: 135,
                    height: 43,
                    color: AppColor.error,
                    child: Text(
                      '멈추기',
                      style: AppTypography.body2B.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                    onTap: () {
                      context.read<LocationViewModel>().stopTracking();
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (builder) => const _StopSecondModal(),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: AppColor.gray300,
                  ),
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: AppColor.gray100,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _StopSecondModal extends StatelessWidget {
  const _StopSecondModal();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) => Dialog(
        insetPadding: const EdgeInsets.all(16),
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(16),
          height: 305,
          width: 343,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '운정 중 발견된 문제점',
                style: AppTypography.title2B,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                '이번 운전에서 발견된 문제점들',
                style: AppTypography.body2R.copyWith(
                  color: AppColor.gray500,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Wrap(
                spacing: 4,
                children: context
                    .read<AbnormalBehaviorViewModel>()
                    .abnormalBehaviorState,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "종합 ${context.read<AbnormalBehaviorViewModel>().abnormalBehaviorState.length.toString()}개",
                style: AppTypography.title3B.copyWith(
                  color: AppColor.main300,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ButtonComponent(
                width: double.infinity,
                height: 43,
                color: AppColor.main,
                child: Text(
                  '확인',
                  style: AppTypography.body2B.copyWith(
                    color: AppColor.white,
                  ),
                ),
                onTap: () {
                  context.read<DrivingViewModel>().drivingOff(context.read<AuthViewModel>().loginResponseModel!);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (builder) => const MainPage()),
                      (_) => false);
                  context.read<LocationViewModel>().resetDistance();
                },
              ),
              const SizedBox(
                height: 12,
              ),
              const Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: AppColor.gray100,
                  ),
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: AppColor.gray300,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
