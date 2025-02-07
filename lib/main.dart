import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';
import 'package:safe_driving/data/repositories/auth_repository.dart';
import 'package:safe_driving/data/repositories/drive_repository.dart';
import 'package:safe_driving/data/repositories/kakao_map_repository.dart';
import 'package:safe_driving/data/repositories/profile_repository.dart';
import 'package:safe_driving/presentation/viewmodels/app/fcm_controller.dart';
import 'package:safe_driving/presentation/viewmodels/driving/abnormal_behavior_view_model.dart';
import 'package:safe_driving/presentation/viewmodels/driving/driving_view_model.dart';
import 'package:safe_driving/presentation/viewmodels/driving/kakao_map_view_model.dart';
import 'package:safe_driving/presentation/viewmodels/driving/location_view_model.dart';
import 'package:safe_driving/presentation/viewmodels/login/auth_view_model.dart';
import 'package:safe_driving/presentation/viewmodels/main/main_bottom_navigation_bar_view_model.dart';
import 'package:safe_driving/presentation/viewmodels/profile/profile_view_model.dart';
import 'package:safe_driving/presentation/views/splash/splsah_page.dart';
import 'core/utils/colors.dart';
import 'data/repositories/google_login_repository.dart';
import 'data/repositories/location_repository.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleSignIn().signOut();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await dotenv.load(fileName: '.env');
  Firebase.initializeApp();
  KakaoSdk.init(
      nativeAppKey: 'f2a6b050dbb322338ab249d4a0684623',
      javaScriptAppKey: '26daff8e9488b846ccbede1d0b65fd6a');
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
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => FcmController(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => KakaoViewModel(
            KakaoMapRepositoryImpl(),
          ),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          highContrastDarkTheme: ThemeData(
            scaffoldBackgroundColor: AppColor.white,
          ),
          theme: ThemeData(
            scaffoldBackgroundColor: AppColor.white,
            appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.white),
          ),
          darkTheme: ThemeData.dark(),
          home: const SplashPage(),
        ),
      ),
    );
  }
}
