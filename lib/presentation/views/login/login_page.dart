import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../../core/utils/icons.dart';
import '../../viewmodels/login/google_login_view_model.dart';
import '../main/main_page.dart';

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
