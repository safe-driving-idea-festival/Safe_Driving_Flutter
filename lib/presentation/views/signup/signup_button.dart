part of 'signup_page.dart';

class _Button extends StatelessWidget {
  const _Button({required this.formKey});

  final GlobalKey<FormState> formKey; // formKey를 전달받음

  @override
  Widget build(BuildContext context) {
    return ButtonComponent(
      width: double.infinity,
      height: 48.h,
      color: AppColor.main,
      child: Text(
        '확인',
        style: AppTypography.body1R.copyWith(
          color: AppColor.white,
        ),
      ),
      onTap: () async {
        if (formKey.currentState?.validate() ?? false) {
          final authViewModel = context.read<AuthViewModel>();
          final login = await authViewModel.signUp();

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (authViewModel.errorMessage.isNotEmpty) {
              final errorMessage = authViewModel.errorMessage ==
                      'internal server error has occurred'
                  ? '이미 등록된 아이디입니다.'
                  : authViewModel.errorMessage;

              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                ),
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        errorMessage,
                        style: AppTypography.body2R,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.main,
                        ),
                        child: Text(
                          '닫기',
                          style: AppTypography.caption1R.copyWith(
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (login) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (builder) => const MainPage()),
                (_) => false,
              );
            }
          });
        }
      },
    );
  }
}
