import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_driving/presentation/viewmodels/login/login_view_model.dart';
import 'package:safe_driving/presentation/viewmodels/profile/profile_view_model.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/icons.dart';
import '../../viewmodels/main/main_bottom_navigation_bar_view_model.dart';
import '../home/home_page.dart';
import '../profile/profile_page.dart';

part 'main_scaffold.dart';

part 'main_bottom_navigation_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileViewModel>().initProfile(
          context.read<AuthViewModel>().loginResponseModel!,
        );
  }

  @override
  Widget build(BuildContext context) {
    return const _Scaffold(
      bottomNavigationBar: _BottomNavigationBar(),
    );
  }
}
