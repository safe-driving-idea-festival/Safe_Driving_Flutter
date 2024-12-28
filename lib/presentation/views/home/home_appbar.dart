part of 'home_page.dart';

class _Appbar extends StatelessWidget implements PreferredSizeWidget {
  const _Appbar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: AppBar(
        leading: AppIcon.logo(),
        leadingWidth: 107.w,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(88.h);
}
