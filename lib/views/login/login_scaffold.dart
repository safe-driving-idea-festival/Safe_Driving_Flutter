part of './login_page.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.googleLogin,
  });

  final Widget googleLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: AppIcon.logo,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 81,
            child: googleLogin,
          ),
        ],
      ),
    );
  }
}
