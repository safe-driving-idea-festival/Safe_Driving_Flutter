import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_driving/presentation/viewmodels/profile/profile_view_model.dart';
import 'package:safe_driving/presentation/widgets/almost_sleep_tag_component.dart';
import 'package:safe_driving/presentation/widgets/sleep_tag_component.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/fonts.dart';
import '../../../data/models/profile_model.dart';
import '../../widgets/exit_tag_component.dart';

part 'profile_scaffold.dart';
part 'profile_profile.dart';
part 'profile_driving_record.dart';
part 'profile_drive_detection.dart';
part 'profile_more_drive.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Scaffold(
      profile: _Profile(),
      drivingRecord: _DrivingRecord(),
    );
  }
}
