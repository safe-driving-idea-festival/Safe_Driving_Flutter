import 'package:flutter/material.dart';
import 'package:safe_driving/presentation/views/main/main_page.dart';

import '../../../core/utils/icons.dart';

part 'login_scaffold.dart';
part 'login_google_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Scaffold(
      googleLogin: _GoogleLoginButton(),
    );
  }
}
