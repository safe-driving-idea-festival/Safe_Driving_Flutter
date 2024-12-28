part of 'driving_page.dart';

class _StopModal extends StatelessWidget {
  const _StopModal();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) => Dialog(
        insetPadding: EdgeInsets.all(16.r),
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(16.r),
          height: 217.h,
          width: 343.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(4.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '운전을 멈추겠습니까?',
                    style: AppTypography.title2B,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: AppIcon.close(
                      width: 36.w,
                      height: 36.h,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 12.h,
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
              SizedBox(
                height: 40.h,
              ),
              ButtonComponent(
                width: double.infinity,
                height: 43.h,
                color: AppColor.error,
                child: Text(
                  '멈추기',
                  style: AppTypography.body2B.copyWith(
                    color: AppColor.white,
                  ),
                ),
                onTap: () {
                  context.read<LocationViewModel>().stopTracking();
                  context.read<DrivingViewModel>().drivingOff(
                      context.read<AuthViewModel>().loginResponseModel!);
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (builder) => const _StopSecondModal(),
                  );
                },
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                spacing: 8.w,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 4.r,
                    backgroundColor: AppColor.gray300,
                  ),
                  CircleAvatar(
                    radius: 4.r,
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
        insetPadding: EdgeInsets.all(16.r),
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(16.r),
          height: 305.h,
          width: 343.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(4.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '운정 중 발견된 문제점',
                style: AppTypography.title2B,
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                '이번 운전에서 발견된 문제점들',
                style: AppTypography.body2R.copyWith(
                  color: AppColor.gray500,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 4.w,
                  children: context
                      .watch<AbnormalBehaviorViewModel>()
                      .abnormalBehaviorState,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                "종합 ${context.read<AbnormalBehaviorViewModel>().abnormalBehaviorState.length.toString()}개",
                style: AppTypography.title3B.copyWith(
                  color: AppColor.main300,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              ButtonComponent(
                width: double.infinity,
                height: 43.h,
                color: AppColor.main,
                child: Text(
                  '확인',
                  style: AppTypography.body2B.copyWith(
                    color: AppColor.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (builder) => const MainPage()),
                      (_) => false);
                  context.read<LocationViewModel>().resetDistance();
                },
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                spacing: 8.w,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 4.r,
                    backgroundColor: AppColor.gray100,
                  ),
                  CircleAvatar(
                    radius: 4.r,
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
