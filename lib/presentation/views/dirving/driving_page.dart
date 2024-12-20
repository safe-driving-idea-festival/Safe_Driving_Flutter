import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_driving/core/utils/colors.dart';
import 'package:safe_driving/core/utils/fonts.dart';
import 'package:safe_driving/core/utils/icons.dart';
import 'package:safe_driving/presentation/viewmodels/driving/abnormal_behavior_view_model.dart';
import 'package:safe_driving/presentation/views/main/main_page.dart';
import 'package:safe_driving/presentation/widgets/button_components.dart';
import 'package:safe_driving/presentation/widgets/driving_info_component.dart';

import '../../viewmodels/driving/driving_view_model.dart';
import '../../viewmodels/driving/location_view_model.dart';

part 'driving_scaffold.dart';
part 'driving_info.dart';
part 'driving_appbar.dart';
part 'driving_abnormal_behavior.dart';
part 'driving_stop_button.dart';
part 'driving_stop_modal.dart';

class DrivingPage extends StatelessWidget {
  const DrivingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Scaffold(
      appbar: _Appbar(),
      drivingInfo: _DrivingInfo(),
      abnormalBehavior: _AbnormalBehavior(),
      stop: _StopButton()
    );
  }
}
