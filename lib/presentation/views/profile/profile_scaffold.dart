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
        padding: const EdgeInsets.fromLTRB(16.0, 70, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 36,
          children: [
            profile,
            drivingRecord,

          ],
        ),
      ),
    );
  }
}
