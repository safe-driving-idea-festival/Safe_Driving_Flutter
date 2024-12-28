import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:safe_driving/core/utils/icons.dart';
import 'package:safe_driving/presentation/viewmodels/login/login_view_model.dart';
import 'package:safe_driving/presentation/views/main/main_page.dart';
import 'package:safe_driving/presentation/widgets/textfield_component.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/fonts.dart';
import '../../widgets/button_components.dart';

part 'signup_scaffold.dart';

part 'signup_appbar.dart';

part 'signup_header.dart';

part 'signup_name.dart';

part 'signup_camId.dart';

part 'signup_emergency_number.dart';

part 'signup_button.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return _Scaffold(
      appbar: const _Appbar(),
      header: const _Header(),
      name: const _Name(),
      camId: const _CamId(),
      emergencyNumbers: _EmergencyNumber(),
      button: _Button(
        formKey: formKey,
      ),
      formKey: formKey,
    );
  }
}
