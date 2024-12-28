part of 'profile_page.dart';

class _Profile extends StatelessWidget {
  const _Profile();

  @override
  Widget build(BuildContext context) {
    final profileModel = context.watch<ProfileViewModel>().profileModel;

    return Row(
      children: [
        Container(
          width: 60.w,
          height: 60.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.gray200,
          ),
          child: Image.asset('assets/icons/profile.png'),
        ),
        SizedBox(width: 20.w), // Proper spacing
        if (profileModel != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profileModel.name,
                style: AppTypography.title2B,
              ),
              Text(
                profileModel.email,
                style: AppTypography.caption1R,
              ),
            ],
          )
        else
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Guest User', // Fallback name
                style: AppTypography.title2B,
              ),
              Text(
                'guest@example.com', // Fallback email
                style: AppTypography.caption1R,
              ),
            ],
          ),
      ],
    );
  }
}