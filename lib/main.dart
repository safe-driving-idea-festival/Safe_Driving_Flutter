import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_driving/presentation/viewmodels/driving/abnormal_behavior_view_model.dart';
import 'package:safe_driving/presentation/viewmodels/driving/driving_view_model.dart';
import 'package:safe_driving/presentation/viewmodels/driving/location_view_model.dart';
import 'package:safe_driving/presentation/viewmodels/login/google_login_view_model.dart';
import 'package:safe_driving/presentation/viewmodels/main/main_bottom_navigation_bar_view_model.dart';
import 'package:safe_driving/presentation/views/splash/splsah_page.dart';
import 'core/utils/colors.dart';
import 'data/repositories/google_login_repository.dart';
import 'data/repositories/location_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => MainBottomNavigationBarViewModel(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => DrivingViewModel(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => AbnormalBehaviorViewModel(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => LocationViewModel(
            GeolocatorLocationRepository(),
          ),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => GoogleLoginViewModel(
            GoogleLoginRepositoryImpl(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.white,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
          bottomNavigationBarTheme:
              const BottomNavigationBarThemeData(backgroundColor: Colors.white),
        ),
        darkTheme: ThemeData.dark(),
        home: const SplashPage(),
      ),
    );
  }
}
