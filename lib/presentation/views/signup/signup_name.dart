part of 'signup_page.dart';

class _Name extends StatelessWidget {
  const _Name();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Row(
          children: [
            const Text(
              '이름(실명)',
              style: AppTypography.body2R,
            ),
            Text(
              '*',
              style: AppTypography.body2R.copyWith(color: AppColor.error),
            ),
          ],
        ),
        TextfieldComponent(
          hintText: '이름을 입력해주세요',
          controller: context.read<AuthViewModel>().nameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '이름을 입력해주세요';
            }
            return null;
          },
        ),
      ],
    );
  }
}
