part of 'driving_page.dart';

class _Appbar extends StatelessWidget implements PreferredSizeWidget {
  const _Appbar();

  static const List<Widget> state = [
    _Good(),
    _Sleep(),
    _FindingRestArea(),
    _ShouldFindRestArea(),
  ];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 48,
        width: 343,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 4,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: state[0],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(58);
}

class _Good extends StatelessWidget {
  const _Good();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        AppIcon.check(color: AppColor.success),
        const Text(
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
      spacing: 10,
      children: [
        AppIcon.warning(color: AppColor.error),
        const Text(
          '졸음 운전 감지했습니다!!!',
          style: AppTypography.caption1R,
        ),
      ],
    );
  }
}

class _FindingRestArea extends StatelessWidget {
  const _FindingRestArea();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        AppIcon.locationMark(color: AppColor.black),
        const Text(
          '주변 졸음 운전 쉼터 찾고 있습니다...',
          style: AppTypography.caption1R,
        ),
      ],
    );
  }
}

class _ShouldFindRestArea extends StatelessWidget {
  const _ShouldFindRestArea();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        AppIcon.locationMark(color: AppColor.black),
        const Text(
          '졸은 쉼터를 찾으세요',
          style: AppTypography.caption1R,
        ),
      ],
    );
  }
}
