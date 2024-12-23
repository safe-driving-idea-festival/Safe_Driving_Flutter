part of 'signup_page.dart';

class _Appbar extends StatelessWidget {
  const _Appbar();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      height: 110,
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: AppIcon.backArrowIos(),
      ),
    );
  }
}
