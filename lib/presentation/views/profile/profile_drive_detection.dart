part of 'profile_page.dart';

class _DriveDetection extends StatelessWidget {
  const _DriveDetection({
    required this.driveModel,
  });

  final Drive driveModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.gray100,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(4.r),
        ),
      ),
      child: Column(
        spacing: 12.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            driveModel.date.substring(0, 10),
            style: AppTypography.title2B,
          ),
          driveModel.detectionCount == 0
              ? Text(
                  '발견된 이상행동이 없습니다.',
                  style: AppTypography.caption1R,
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5.h,
                  children: [
                    Wrap(
                      spacing: 4.w,
                      runSpacing: 5.h,
                      children: List.generate(
                        driveModel.detectionInfo.sleeping,
                        (_) => const SleepTagComponent(),
                      ),
                    ),
                    Wrap(
                      spacing: 4.w,
                      runSpacing: 5.h,
                      children: List.generate(
                        driveModel.detectionInfo.almostSleep,
                        (_) => const AlmostSleepTagComponent(),
                      ),
                    ),
                    Wrap(
                      spacing: 4.w,
                      runSpacing: 5.h,
                      children: List.generate(
                        driveModel.detectionInfo.exit,
                        (_) => const ExitTagComponent(),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
