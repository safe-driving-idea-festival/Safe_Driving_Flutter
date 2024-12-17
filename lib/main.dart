import 'package:flutter/material.dart';
import 'package:safe_driving/design_system/colors.dart';
import 'package:safe_driving/views/splash/splsah_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.white,
      ),
      darkTheme: ThemeData.dark(),
      home: SplashPage(),
    );
  }
}
