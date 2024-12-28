part of 'profile_page.dart';

class _DrivingRecord extends StatelessWidget {
  const _DrivingRecord();

  @override
  Widget build(BuildContext context) {
    final profileModel = context.watch<ProfileViewModel>().profileModel;

    final hasDrives =
        profileModel?.driveCount != null && profileModel!.driveCount > 0;
    final driveCount = hasDrives ? profileModel.driveCount : 0;
    final displayedDrives = hasDrives ? profileModel.drives : [];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '운전 기록',
              style: AppTypography.title2B,
            ),
            Material(
              color: AppColor.white,
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => const _MoreDrive(),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 71.w,
                  height: 34.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.main),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.r),
                    ),
                  ),
                  child: Text(
                    '더보기',
                    style: AppTypography.caption1R.copyWith(
                      color: AppColor.main,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 16.h),
        if (!hasDrives)
          Center(
            child: Text(
              '운전 기록이 없습니다.',
              style: AppTypography.caption1R,
            ),
          )
        else
          ListView.separated(
            padding: const EdgeInsets.all(0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) => _DriveDetection(
              driveModel: displayedDrives[driveCount - index - 1],
            ),
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 8.h,
            ),
            itemCount: driveCount >= 3 ? 3 : driveCount,
          ),
      ],
    );
  }
}
