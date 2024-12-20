part of 'driving_page.dart';

class _AbnormalBehavior extends StatelessWidget {
  const _AbnormalBehavior();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 7,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '발견된 이상행동',
              style: AppTypography.body2B,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: const BoxDecoration(),
                child: Row(
                  spacing: 4,
                  children: [
                    Text(
                      '더보기',
                      style: AppTypography.caption2R.copyWith(
                        fontWeight: FontWeight.w200,
                        color: AppColor.gray500,
                      ),
                    ),
                    AppIcon.forwardArrow(color: AppColor.gray500)
                  ],
                ),
              ),
            )
          ],
        ),
         Wrap(
          spacing: 7,
          children: context.watch<AbnormalBehaviorViewModel>().abnormalBehaviorState
        ),
      ],
    );
  }
}
