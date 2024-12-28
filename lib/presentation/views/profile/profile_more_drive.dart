part of 'profile_page.dart';

class _MoreDrive extends StatelessWidget {
  const _MoreDrive();

  @override
  Widget build(BuildContext context) {
    final profileModel = context.watch<ProfileViewModel>().profileModel;

    final hasDrives = profileModel?.driveCount != null && profileModel!.driveCount > 0;
    final driveCount = hasDrives ? profileModel.driveCount : 0;
    final displayedDrives = hasDrives ? profileModel.drives : [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '운전 기록',
                style: AppTypography.title2B,
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
                  itemCount: driveCount,
                ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}