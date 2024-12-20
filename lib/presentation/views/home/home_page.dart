import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_driving/core/utils/colors.dart';
import 'package:safe_driving/core/utils/fonts.dart';
import 'package:safe_driving/presentation/viewmodels/driving/driving_view_model.dart';
import 'package:safe_driving/presentation/viewmodels/driving/location_view_model.dart';
import 'package:safe_driving/presentation/views/dirving/driving_page.dart';
import 'package:safe_driving/presentation/widgets/button_components.dart';
import 'package:safe_driving/presentation/widgets/driving_info_component.dart';

import '../../../core/utils/icons.dart';
import '../../viewmodels/driving/abnormal_behavior_view_model.dart';

part 'home_scaffold.dart';
part 'home_driving_info.dart';
part 'home_start_button.dart';
part 'home_bluetooth_connect_modal.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Scaffold(
      drivingInfo: _DrivingInfo(),
      button: _StartButton(),
    );
  }
}
