part of 'login_page.dart';

class _GoogleLoginButton extends StatelessWidget {
  const _GoogleLoginButton();

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.read<AuthViewModel>();

    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        AppIcon.googleLogin(),
        Container(
          decoration: const BoxDecoration(),
          width: 343,
          height: 48,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () async {
                await authViewModel.signInWithGoogle().then((result) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (result) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (builder) => const MainPage()),
                        (_) => false,
                      );
                    } else if (authViewModel.google != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (builder) => SignupPage(),
                        ),
                      );
                    }
                  });
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
