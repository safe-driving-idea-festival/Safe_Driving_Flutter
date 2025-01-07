part of 'profile_page.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.profile,
    required this.drivingRecord,
  });

  final Widget profile;
  final Widget drivingRecord;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.0.w, 70.h, 16.w, 0.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 36.h,
            children: [
              profile,
              drivingRecord,
            ],
          ),
        ),
      ),
    );
  }
}
