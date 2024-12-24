part of 'home_page.dart';

class _Appbar extends StatelessWidget implements PreferredSizeWidget {
  const _Appbar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        leading: AppIcon.logo(),
        leadingWidth: 107,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(88);
}
