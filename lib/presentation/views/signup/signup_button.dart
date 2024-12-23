part of 'signup_page.dart';

class _Button extends StatelessWidget {
  const _Button({required this.formKey});

  final GlobalKey<FormState> formKey; // formKey를 전달받음

  @override
  Widget build(BuildContext context) {
    return ButtonComponent(
      width: double.infinity,
      height: 48,
      color: AppColor.main,
      child: Text(
        '확인',
        style: AppTypography.body1R.copyWith(
          color: AppColor.white,
        ),
      ),
      onTap: () async {
        if (formKey.currentState?.validate() ?? false) {
          print('Form is valid');
          final login = await context.read<AuthViewModel>().signUp();
          if (login) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (builder) => MainPage()),
                (_) => false,);
          }
        } else {
          print('Form is invalid');
        }
      },
    );
  }
}
