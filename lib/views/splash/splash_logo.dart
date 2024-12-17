part of './splsah_page.dart';

class _Logo extends StatefulWidget {
  const _Logo({super.key});

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
      Duration(seconds: 2),
      () => Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (builder) => HomePage()),
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
          child: SvgPicture.asset(
            'assets/icons/logo.svg',
            width: 208,
            height: 67,
          ),
        ),
      ),
    );
  }
}
