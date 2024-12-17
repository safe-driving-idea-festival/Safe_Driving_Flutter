import 'dart:async';
import 'package:flutter/material.dart';
import 'package:safe_driving/design_system/icons.dart';
import 'package:safe_driving/views/login/login_page.dart';

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
