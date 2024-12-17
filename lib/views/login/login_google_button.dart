part of './login_page.dart';

class _GoogleLoginButton extends StatelessWidget {
  const _GoogleLoginButton();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        AppIcon.googleLogin,
        Container(
          decoration: const BoxDecoration(),
          width: 343,
          height: 48,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (builder) => const MainPage()),
                (_) => false,
              ),
            ),
          ),
        )
      ],
    );
  }
}
