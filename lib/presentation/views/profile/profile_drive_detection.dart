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
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.gray100,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            driveModel.date.substring(0, 10),
            style: AppTypography.title2B,
          ),
          driveModel.detectionCount == 0
              ? const Text(
                  '발견된 이상행동이 없습니다.',
                  style: AppTypography.caption1R,
                )
              : Column(
                  children: [
                    Wrap(
                      spacing: 4,
                      children: List.generate(
                        driveModel.detectionInfo.sleeping,
                        (_) => const SleepTagComponent(),
                      ),
                    ),
                    Wrap(
                      spacing: 4,
                      children: List.generate(
                        driveModel.detectionInfo.almostSleep,
                        (_) => const AlmostSleepTagComponent(),
                      ),
                    ),
                    Wrap(
                      spacing: 4,
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
