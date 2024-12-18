part of './splsah_page.dart';

class _Logo extends StatefulWidget {
  const _Logo();

  @override
  State<_Logo> createState() => _LogoState();
}

class _LogoState extends State<_Logo> with TickerProviderStateMixin {
  late final CurvedAnimation _curvedAnimation =
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCirc);
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.forward();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushAndRemoveUntil(
          PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return const LoginPage();
              },
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
              transitionDuration: const Duration(milliseconds: 200)),
          (predicate) => false),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _curvedAnimation.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _curvedAnimation,
      builder: (context, builder) => Transform.translate(
        offset: Offset(_curvedAnimation.value * 60 - 60, 0),
        child: Opacity(
          opacity: _controller.value,
          child: AppIcon.logo(),
        ),
      ),
    );
  }
}
