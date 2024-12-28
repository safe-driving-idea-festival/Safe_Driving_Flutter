import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safe_driving/presentation/widgets/almost_sleep_tag_component.dart';
import 'package:safe_driving/presentation/widgets/exit_tag_component.dart';
import 'package:safe_driving/presentation/widgets/sleep_tag_component.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/fonts.dart';
import '../../widgets/button_components.dart';
import '../driving/abnormal_behavior_view_model.dart';

class FcmController with ChangeNotifier {
  RemoteMessage? _message;

  RemoteMessage? get message => _message;
  late AbnormalBehaviorViewModel _abnormalBehaviorState;

  static Future<void> _backgroundHandler(RemoteMessage message) async {}

  void initAbnormalBehaviorViewModel(AbnormalBehaviorViewModel abnormal) {
    _abnormalBehaviorState = abnormal;
    notifyListeners();
  }

  Future<void> initialize() async {
    // Initialize Firebase
    await Firebase.initializeApp();

    // Request notification permissions
    await FirebaseMessaging.instance.requestPermission();

    // Set up Android Notification Channel
    const AndroidNotificationChannel androidNotificationChannel =
        AndroidNotificationChannel(
      'high_importance_channel', // Arbitrary id
      'High Importance Notifications', // Name shown in settings
      description: 'This channel is used for important notifications.',
      // Description shown in settings
      importance: Importance.high,
    );

    // Create the Notification Channel
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);

    // Listen for foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage rm) {
      _message = rm;
      if (rm.notification?.title == '전방을 주시해주세요!') {
        _abnormalBehaviorState
            .addAbnormalBehaviorState(const ExitTagComponent());
      } else if (rm.notification?.title == "지금 졸려보여요!") {
        _abnormalBehaviorState
            .addAbnormalBehaviorState(const AlmostSleepTagComponent());
      } else if (rm.notification?.title == "졸음이 감지되었습니다.") {
        _abnormalBehaviorState
            .addAbnormalBehaviorState(const SleepTagComponent());
      }
      Get.dialog(Dialog(
        insetPadding: EdgeInsets.all(16.r),
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(16.r),
          height: 220.h,
          width: 343.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(4.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  rm.notification?.title.toString() ?? 'No Title',
                  style: AppTypography.title2B,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  rm.notification?.body.toString() ?? 'No Body',
                  style: AppTypography.body2R.copyWith(
                    color: AppColor.gray500,
                  ),
                ),
              ),
              const Spacer(),
              ButtonComponent(
                width: 146.w,
                height: 43.h,
                color: AppColor.gray700,
                child: Text(
                  '확인했습니다',
                  style: AppTypography.body2B.copyWith(
                    color: AppColor.white,
                  ),
                ),
                onTap: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ));
      notifyListeners();
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage rm) {
      _message = rm;
      if (rm.notification?.title == '전방을 주시해주세요!') {
        _abnormalBehaviorState.addAbnormalBehaviorState(const ExitTagComponent());
      } else if (rm.notification?.title == "지금 졸려보여요!") {
        _abnormalBehaviorState
            .addAbnormalBehaviorState(const AlmostSleepTagComponent());
      } else if (rm.notification?.title == "졸음이 감지되었습니다.") {
        _abnormalBehaviorState.addAbnormalBehaviorState(const SleepTagComponent());
      }
      Get.dialog(Dialog(
        insetPadding: EdgeInsets.all(16.r),
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(16.r),
          height: 220.h,
          width: 343.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(4.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  rm.notification?.title.toString() ?? 'No Title',
                  style: AppTypography.title2B,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  rm.notification?.body.toString() ?? 'No Body',
                  style: AppTypography.body2R.copyWith(
                    color: AppColor.gray500,
                  ),
                ),
              ),
              const Spacer(),
              ButtonComponent(
                width: double.infinity,
                height: 43.h,
                color: AppColor.gray700,
                child: Text(
                  '확인했습니다',
                  style: AppTypography.body2B.copyWith(
                    color: AppColor.white,
                  ),
                ),
                onTap: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ));
      notifyListeners();
    });
    // Register the background message handler
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  }
}
