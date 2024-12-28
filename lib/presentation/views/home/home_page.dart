import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:safe_driving/core/utils/colors.dart';
import 'package:safe_driving/core/utils/fonts.dart';
import 'package:safe_driving/presentation/viewmodels/app/fcm_controller.dart';
import 'package:safe_driving/presentation/viewmodels/driving/driving_view_model.dart';
import 'package:safe_driving/presentation/viewmodels/driving/location_view_model.dart';
import 'package:safe_driving/presentation/viewmodels/login/login_view_model.dart';
import 'package:safe_driving/presentation/views/dirving/driving_page.dart';
import 'package:safe_driving/presentation/widgets/button_components.dart';
import 'package:safe_driving/presentation/widgets/driving_info_component.dart';
import '../../../core/utils/icons.dart';
import '../../viewmodels/driving/abnormal_behavior_view_model.dart';

part 'home_scaffold.dart';
part 'home_driving_info.dart';
part 'home_start_button.dart';
part 'home_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Scaffold(
      appbar: _Appbar(),
      drivingInfo: _DrivingInfo(),
      button: _StartButton(),
    );
  }
}
