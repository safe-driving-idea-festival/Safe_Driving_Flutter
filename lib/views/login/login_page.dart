import 'package:flutter/material.dart';
import 'package:safe_driving/design_system/icons.dart';

part './login_scaffold.dart';
part './login_google_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Scaffold(
      googleLogin: _GoogleLoginButton(),
    );
  }
}
