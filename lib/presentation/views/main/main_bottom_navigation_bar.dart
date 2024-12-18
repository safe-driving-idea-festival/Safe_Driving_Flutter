part of 'main_page.dart';

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex:
          context.read<MainBottomNavigationBarViewModel>().currentIndex,
      onTap: (index) =>
          context.read<MainBottomNavigationBarViewModel>().setIndex(index),
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
          icon:
              context.watch<MainBottomNavigationBarViewModel>().currentIndex ==
                      0
                  ? AppIcon.tabbarFillHome(color: AppColor.main)
                  : AppIcon.tabbarOutlineHome(color: AppColor.gray500),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon:
              context.watch<MainBottomNavigationBarViewModel>().currentIndex ==
                      1
                  ? AppIcon.tabbarFillMusic(color: AppColor.main)
                  : AppIcon.tabbarOutlineMusic(color: AppColor.gray500),
          label: '음악',
        ),
        BottomNavigationBarItem(
          icon:
              context.watch<MainBottomNavigationBarViewModel>().currentIndex ==
                      2
                  ? AppIcon.tabbarFillAlert(color: AppColor.main)
                  : AppIcon.tabbarOutlineAlert(color: AppColor.gray500),
          label: '알림',
        ),
        BottomNavigationBarItem(
          icon:
              context.watch<MainBottomNavigationBarViewModel>().currentIndex ==
                      3
                  ? AppIcon.tabbarFillProfile(color: AppColor.main)
                  : AppIcon.tabbarOutlineProfile(color: AppColor.gray500),
          label: '프로필',
        ),
      ],
    );
  }
}
