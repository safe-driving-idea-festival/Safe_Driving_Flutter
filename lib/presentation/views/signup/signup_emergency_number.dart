part of 'signup_page.dart';

class _EmergencyNumber extends StatelessWidget {
   _EmergencyNumber();

  final _formKey = GlobalKey<FormState>(); // FormKey 선언

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        const Text(
          '연락처',
          style: AppTypography.body2R,
        ),
        Form(
          key: _formKey, // Form에 key 설정
          child: TextfieldComponent(
            hintText: '비상 연락처',
            controller:
                context.read<AuthViewModel>().emergencyNumbersController,
            validator: (value) {
              // 연락처가 비어있는 경우 유효성 검사
              if (value == null || value.isEmpty) {
                return '연락처를 입력해주세요 ex) 010********';
              }
              final phoneRegExp =
                  RegExp(r'^(010|011|016|017|019)-?\d{3,4}-?\d{4}$');
              if (!phoneRegExp.hasMatch(value)) {
                return '올바른 전화번호를 입력해주세요. 예: 010********';
              }

              return null; // 유효성 검사 통과 시 null 반환
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            if (_formKey.currentState?.validate() ?? false) {
              context.read<AuthViewModel>().addEmergencyNumber();
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
                border: Border.all(
                  color: AppColor.gray100,
                )),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                AppIcon.plus(color: AppColor.gray500),
                Text(
                  '연락처 추가하기',
                  style: AppTypography.caption1R.copyWith(
                    color: AppColor.gray500,
                  ),
                ),
              ],
            ),
          ),
        ),
        ListView.separated(
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          primary: true,
          shrinkWrap: true,
          itemBuilder: (context, value) => GestureDetector(
            onLongPress: () =>
                context.read<AuthViewModel>().removeEmergencyNumber(value),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                  border: Border.all(
                    color: AppColor.gray100,
                  )),
              alignment: Alignment.centerLeft,
              child: Text(
                context.watch<AuthViewModel>().emergencyNumber[value],
              ),
            ),
          ),
          separatorBuilder: (context, value) => const SizedBox(
            height: 8,
          ),
          itemCount: context.watch<AuthViewModel>().emergencyNumber.length,
        ),
      ],
    );
  }
}
