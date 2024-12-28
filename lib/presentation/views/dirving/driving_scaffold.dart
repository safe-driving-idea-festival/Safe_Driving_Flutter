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
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 24.h,
        ),
        child: Column(
          children: [
            drivingInfo,
            SizedBox(height: 30.h),
            abnormalBehavior,
            const Spacer(),
            stop,
            SizedBox(height: 43.h)
          ],
        ),
      ),
    );
  }
}
