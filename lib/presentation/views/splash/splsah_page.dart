import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/utils/icons.dart';
import '../login/login_page.dart';

part 'splash_logo.dart';
part 'splash_scaffold.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Scaffold(
      logo: _Logo(),
    );
  }
}
