import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:safe_driving/data/repositories/auth_repository.dart';
import 'package:safe_driving/data/repositories/drive_repository.dart';
import 'package:safe_driving/data/repositories/profile_repository.dart';
import 'package:safe_driving/presentation/viewmodels/driving/abnormal_behavior_view_model.dart';
import 'package:safe_driving/presentation/viewmodels/driving/driving_view_model.dart';
import 'package:safe_driving/presentation/viewmodels/driving/location_view_model.dart';
import 'package:safe_driving/presentation/viewmodels/login/login_view_model.dart';
import 'package:safe_driving/presentation/viewmodels/main/main_bottom_navigation_bar_view_model.dart';
import 'package:safe_driving/presentation/viewmodels/profile/profile_view_model.dart';
import 'package:safe_driving/presentation/views/splash/splsah_page.dart';
import 'core/utils/colors.dart';
import 'data/repositories/google_login_repository.dart';
import 'data/repositories/location_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleSignIn().signOut();
  await dotenv.load(fileName: '.env');
  // await Firebase.initializeApp();
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  // String? token = await messaging.getToken();
  // print("FCM Token: $token");
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
          create: (BuildContext context) => DrivingViewModel(
            DriveRepositoryImpl(),
          ),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => AbnormalBehaviorViewModel(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => LocationViewModel(
            LocationRepositoryImpl(),
          ),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => AuthViewModel(
            GoogleLoginRepositoryImpl(),
            AuthRepositoryImpl(),
          ),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ProfileViewModel(
            ProfileRepositoryImpl(),
          ),
        )
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
