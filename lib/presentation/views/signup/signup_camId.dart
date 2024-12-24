part of 'signup_page.dart';

class _CamId extends StatelessWidget {
  const _CamId();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Row(
          children: [
            const Text(
              '카메라 아이디',
              style: AppTypography.body2R,
            ),
            Text(
              '*',
              style: AppTypography.body2R.copyWith(color: AppColor.error),
            ),
          ],
        ),
        TextfieldComponent(
          hintText: '카메라 아이디를 입력해주세요',
          controller: context.read<AuthViewModel>().camIdController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '카메라 아이디를 입력해주세요';
            }
            return null;
          },
        ),
      ],
    );
  }
}
