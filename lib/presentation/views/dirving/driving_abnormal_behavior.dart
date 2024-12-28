part of 'driving_page.dart';

class _AbnormalBehavior extends StatelessWidget {
  const _AbnormalBehavior();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 7.h,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '발견된 이상행동',
              style: AppTypography.body2B,
            ),
          ],
        ),
         Container(
           height: 110.h,
           child: SingleChildScrollView(
             child: Wrap(
               runSpacing: 5.h,
              spacing: 7.w,
              children: context.watch<AbnormalBehaviorViewModel>().abnormalBehaviorState
                     ),
           ),
         ),
      ],
    );
  }
}
