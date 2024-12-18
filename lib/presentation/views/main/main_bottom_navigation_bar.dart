part of 'main_page.dart';

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: context.read<MainBottomNavigationBarViewModel>().currentIndex,
      onTap: (index) => context.read<MainBottomNavigationBarViewModel>().setIndex(index),
      type: BottomNavigationBarType.fixed,
      unselectedLabelStyle: const TextStyle(
        fontFamily: "PyeongChang",
        fontWeight: FontWeight.w400,
      ),
      selectedLabelStyle: const TextStyle(
        fontFamily: "PyeongChang",
        fontWeight: FontWeight.w400,
      ),
      selectedItemColor: AppColor.main,
      unselectedItemColor: AppColor.gray500,
      items: [
        BottomNavigationBarItem(
          icon: AppIcon.tabbarOutlineHome(
              color:
                  context.watch<MainBottomNavigationBarViewModel>().currentIndex == 0 ? AppColor.main : AppColor.gray500),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: AppIcon.tabbarOutlineMusic(
              color:
                  context.watch<MainBottomNavigationBarViewModel>().currentIndex == 1 ? AppColor.main : AppColor.gray500),
          label: '음악',
        ),
        BottomNavigationBarItem(
          icon: AppIcon.tabbarOutlineAlert(
              color:
              context.watch<MainBottomNavigationBarViewModel>().currentIndex == 2 ? AppColor.main : AppColor.gray500),
          label: '알림',
        ),
        BottomNavigationBarItem(
          icon: AppIcon.tabbarOutlineProfile(
              color:
              context.watch<MainBottomNavigationBarViewModel>().currentIndex == 3 ? AppColor.main : AppColor.gray500),
          label: '프로필',
        ),
      ],
    );
  }
}
