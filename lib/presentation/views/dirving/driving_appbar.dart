part of 'driving_page.dart';

class _Appbar extends StatelessWidget implements PreferredSizeWidget {
  const _Appbar();

  @override
  Widget build(BuildContext context) {
    Widget? state() {
      if (context
          .watch<AbnormalBehaviorViewModel>()
          .abnormalBehaviorState
          .isEmpty) {
        return const _Good();
      }
      switch (context
          .watch<AbnormalBehaviorViewModel>()
          .abnormalBehaviorState
          .last) {
        case SleepTagComponent():
        case AlmostSleepTagComponent():
          return const _Sleep();
        case ExitTagComponent():
          return const _Exit();
        default:
          return null;
      }
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        height: 48.h,
        width: 343.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(4.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 4.r,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: state(),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(58.h);
}

class _Good extends StatelessWidget {
  const _Good();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        AppIcon.check(color: AppColor.success),
        Text(
          '현재 상태 좋음. 졸리면 쉬어가세요.',
          style: AppTypography.caption1R,
        ),
      ],
    );
  }
}

class _Sleep extends StatelessWidget {
  const _Sleep();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        AppIcon.warning(color: AppColor.error),
        Text(
          '졸음 운전 감지했습니다!!!',
          style: AppTypography.caption1R,
        ),
      ],
    );
  }
}

class _Exit extends StatelessWidget {
  const _Exit();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: <Widget>[
        AppIcon.emergency(color: AppColor.error),
        Text(
          '화면을 이탈했습니다!',
          style: AppTypography.caption1R,
        ),
      ],
    );
  }
}
