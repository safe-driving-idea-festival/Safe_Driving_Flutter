part of 'profile_page.dart';

class _DrivingRecord extends StatelessWidget {
  const _DrivingRecord();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '운전 기록',
              style: AppTypography.title2B,
            ),
            Material(
              color: AppColor.white,
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => _MoreDrive(),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 71,
                  height: 34,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.main),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
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
        const SizedBox(
          height: 16,
        ),
        ListView.separated(
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => _DriveDetection(
            driveModel: context.watch<ProfileViewModel>().profileModel!.drives[
                context.watch<ProfileViewModel>().profileModel!.driveCount -
                    index -
                    1],
          ),
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 8,
          ),
          itemCount: 3,
        )
      ],
    );
  }
}
