part of 'splsah_page.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.logo,
  });

  final Widget logo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: logo,
      ),
    );
  }
}
