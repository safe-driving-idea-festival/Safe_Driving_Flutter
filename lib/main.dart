import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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
import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("백그라운드 메시지 처리.. ${message.notification!.body!}");
}

void initializeNotification() async {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(const AndroidNotificationChannel(
          'high_importance_channel', 'high_importance_notification',
          importance: Importance.max));

  await flutterLocalNotificationsPlugin.initialize(const InitializationSettings(
    android: AndroidInitializationSettings("@mipmap/ic_launcher"),
  ));

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleSignIn().signOut();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initializeNotification();
  await dotenv.load(fileName: '.env');
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
