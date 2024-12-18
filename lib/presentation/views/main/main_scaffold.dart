part of 'main_page.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.appbar,
    required this.bottomNavigationBar,
  });

  final PreferredSizeWidget appbar;
  final Widget bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appbar,
      body: const Column(
        children: [],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
