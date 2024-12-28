import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:safe_driving/presentation/views/signup/signup_page.dart';


import '../../../core/utils/icons.dart';
import '../../viewmodels/login/login_view_model.dart';
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
