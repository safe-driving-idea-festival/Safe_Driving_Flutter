import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class FcmViewModel with ChangeNotifier {
  RemoteMessage? _message;

  RemoteMessage? get message => _message;

  Future<void> initialize() async {
    // Firebase 초기화
    await Firebase.initializeApp();

    // FirebaseMessaging 권한 요청
    await FirebaseMessaging.instance.requestPermission();

    // 메시지 수신 처리
    FirebaseMessaging.onMessage.listen((RemoteMessage rm) {
      _message = rm;
      notifyListeners(); // 상태 변경 알림
    });
  }
}
