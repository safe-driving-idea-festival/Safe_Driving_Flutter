part of 'home_page.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.drivingInfo,
    required this.button,
    required this.appbar,
  });

  final PreferredSizeWidget appbar;
  final Widget drivingInfo;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          spacing: 37.h,
          children: [
            drivingInfo,
            button,
          ],
        ),
      ),
    );
  }
}
