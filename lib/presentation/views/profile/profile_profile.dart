part of 'profile_page.dart';

class _Profile extends StatelessWidget {
  const _Profile();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.gray200,
          ),
          child: Image.asset('assets/icons/profile.png'),
        ),
        Container(
          decoration: const BoxDecoration(),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.watch<ProfileViewModel>().profileModel!.name,
                style: AppTypography.title2B,
              ),
              Text(
                context.watch<ProfileViewModel>().profileModel!.email,
                style: AppTypography.caption1R,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
