import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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
  var messageString = "";

  void getMyDeviceToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    print("내 디바이스 토큰: $token");
  }

  @override
  void initState() {
    super.initState();
    context.read<ProfileViewModel>().initProfile(
          context.read<AuthViewModel>().loginResponseModel!,
        );
    getMyDeviceToken();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;

      if (notification != null) {
        FlutterLocalNotificationsPlugin().show(
          notification.hashCode,
          notification.title,
          notification.body,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'high_importance_channel',
              'high_importance_notification',
              importance: Importance.max,
            ),
          ),
        );
        setState(() {
          messageString = message.notification!.body!;
          print("Foreground 메시지 수신: $messageString");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const _Scaffold(
      bottomNavigationBar: _BottomNavigationBar(),
    );
  }
}
