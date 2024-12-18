import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_driving/presentation/viewmodels/main/main_bottom_navigation_bar_view_model.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/icons.dart';

part 'main_scaffold.dart';
part 'main_bottom_navigation_bar.dart';
part 'main_appbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>MainBottomNavigationBarViewModel(),
      child: const _Scaffold(
        appbar: _Appbar(),
        bottomNavigationBar: _BottomNavigationBar(),
      ),
    );
  }
}
