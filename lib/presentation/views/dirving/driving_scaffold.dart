part of 'driving_page.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.appbar,
    required this.drivingInfo,
    required this.abnormalBehavior,
    required this.stop,
  });

  final PreferredSizeWidget appbar;
  final Widget drivingInfo;
  final Widget abnormalBehavior;
  final Widget stop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: Column(
          children: [
            drivingInfo,
            const SizedBox(height: 30),
            abnormalBehavior,
            const Spacer(),
            stop,
            const SizedBox(
              height: 43,
            )
          ],
        ),
      ),
    );
  }
}
