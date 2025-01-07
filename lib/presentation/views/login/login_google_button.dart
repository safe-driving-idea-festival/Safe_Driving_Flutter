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
        Container(
          height: 48.h,
          width: 343.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(4.r),
            ),
            border: Border.all(
              color: Color(0xffe9e9e9),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
              vertical: 12.h,
            ),
            child: Row(
              spacing: 50.w,
              children: [
                AppIcon.googleLogin(),
                const Text(
                  'Google 계정으로 로그인',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 343.w,
          height: 48.h,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.all(
                Radius.circular(4.r),
              ),
              onTap: () async {
                await authViewModel.signInWithGoogle().then(
                  (result) {
                    WidgetsBinding.instance.addPostFrameCallback(
                      (_) {
                        if (result) {
                          if (context
                                  .read<AuthViewModel>()
                                  .loginResponseModel!
                                  .authority !=
                              "UNAUTHORIZATION") {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (builder) => const MainPage()),
                              (_) => false,
                            );
                          } else {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (builder) => SignupPage(),
                              ),
                            );
                          }
                        } else {}
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
