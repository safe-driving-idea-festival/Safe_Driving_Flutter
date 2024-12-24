part of 'main_page.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.bottomNavigationBar,
  });

  final Widget bottomNavigationBar;
  static const List<Widget> body = [
    HomePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: body[context.watch<MainBottomNavigationBarViewModel>().currentIndex],
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
