import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/utils/icons.dart';
import '../login/login_page.dart';

part 'splash_logo.dart';

part 'splash_scaffold.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  Widget build(BuildContext context) {
    return const _Scaffold(
      logo: _Logo(),
    );
  }
}
