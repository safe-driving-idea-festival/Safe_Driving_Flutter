part of 'profile_page.dart';

class _MoreDrive extends StatelessWidget {
  const _MoreDrive();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '운전 기록',
                style: AppTypography.title2B,
              ),
              const SizedBox(
                height: 16,
              ),
              ListView.separated(
                padding: EdgeInsets.all(0),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => _DriveDetection(
                  driveModel: context
                          .watch<ProfileViewModel>()
                          .profileModel!
                          .drives[
                      context.watch<ProfileViewModel>().profileModel!.driveCount -
                          index -
                          1],
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 8,
                ),
                itemCount:
                    context.watch<ProfileViewModel>().profileModel!.driveCount,
              ),
              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
