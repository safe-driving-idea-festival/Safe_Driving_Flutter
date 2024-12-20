import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/icons.dart';
import '../../viewmodels/main/main_bottom_navigation_bar_view_model.dart';
import '../alert/alert_page.dart';
import '../home/home_page.dart';
import '../music/music_page.dart';
import '../profile/profile_page.dart';

part 'main_scaffold.dart';

part 'main_bottom_navigation_bar.dart';

part 'main_appbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const _Scaffold(
      appbar: _Appbar(),
      bottomNavigationBar: _BottomNavigationBar(),
    );
  }
}
