import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safe_driving/views/home/home_page.dart';

part './splash_logo.dart';
part './splash_scaffold.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Scaffold(
      logo: _Logo(),
    );
  }
}
