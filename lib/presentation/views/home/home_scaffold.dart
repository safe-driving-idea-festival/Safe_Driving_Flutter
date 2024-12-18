part of 'home_page.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.drivingInfo,
    required this.button,
  });

  final Widget drivingInfo;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 37,
          children: [
            drivingInfo,
            button,
          ],
        ),
      ),
    );
  }
}
