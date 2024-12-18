part of 'main_page.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.appbar,
    required this.bottomNavigationBar,
  });

  final PreferredSizeWidget appbar;
  final Widget bottomNavigationBar;
  static const List<Widget> body = [
    HomePage(),
    MusicPage(),
    AlertPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: PageView(
        controller:
            context.read<MainBottomNavigationBarViewModel>().pageController,
        onPageChanged: (index)=> context.read<MainBottomNavigationBarViewModel>().setIndex(index),
        children: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
