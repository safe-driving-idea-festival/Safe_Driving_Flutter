import 'dart:async';
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';
import 'package:safe_driving/presentation/viewmodels/driving/kakao_map_view_model.dart';
import 'package:safe_driving/presentation/viewmodels/driving/location_view_model.dart';
import 'package:safe_driving/presentation/widgets/google_map.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/fonts.dart';
import '../../widgets/almost_sleep_tag_component.dart';
import '../../widgets/button_components.dart';
import '../../widgets/exit_tag_component.dart';
import '../../widgets/sleep_tag_component.dart';
import '../driving/abnormal_behavior_view_model.dart';

class FcmController with ChangeNotifier {
  FcmController();

  final player1 = AudioPlayer();
  final player2 = AudioPlayer();
  final player3 = AudioPlayer();
  final player4 = AudioPlayer();

  RemoteMessage? _message;
  late AbnormalBehaviorViewModel _abnormalBehaviorState;

  RemoteMessage? get message => _message;

  // 사운드를 설정하고 재생하는 함수
  Future<void> _playSound(String path, AudioPlayer player) async {
    await player.setVolume(1.0);
    await player.setAsset(path);
    await player.setLoopMode(LoopMode.one);
    await player.play();
  }

  // 모든 사운드를 정지하는 함수
  Future<void> stopSound() async {
    await Future.wait(
      [
        player1.stop(),
        player2.stop(),
        player3.stop(),
        player4.stop(),
      ],
    );
  }

  // 알림 처리 함수
  Future<void> _handleNotification(RemoteMessage rm) async {
    if (rm.notification?.title == '전방을 주시해주세요!') {
      _showNotificationDialog(rm);
      _abnormalBehaviorState.addAbnormalBehaviorState(const ExitTagComponent());
      await _playSound('assets/sound/exit.mp3', player3);
    } else if (rm.notification?.title == "지금 졸려보여요!") {
      _showNotificationDialog(rm);
      _abnormalBehaviorState
          .addAbnormalBehaviorState(const AlmostSleepTagComponent());
      await _playSound('assets/sound/almost_sleep.mp3', player2);
    } else if (rm.notification?.title == "졸음이 감지되었습니다.") {
      _showNotificationDialog(rm);
      _abnormalBehaviorState
          .addAbnormalBehaviorState(const SleepTagComponent());
      await _playSound('assets/sound/sleeping.mp3', player1);
    } else {
      Timer(Duration(seconds: 2), () async => await stopSound());
    }
    notifyListeners();
  }

  // 알림 다이얼로그 표시 함수
  void _showNotificationDialog(RemoteMessage rm) async {
    Get.dialog(_NotificationModal(rm: rm)).then((_) async {
      await stopSound();
    });
  }

  // 비정상적인 행동을 처리할 ViewModel 초기화
  void initAbnormalBehaviorViewModel(AbnormalBehaviorViewModel abnormal) {
    _abnormalBehaviorState = abnormal;
    notifyListeners();
  }

  // Firebase 초기화 및 메시징 설정
  Future<void> initialize() async {
    await Firebase.initializeApp();
    await FirebaseMessaging.instance.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage rm) async {
      if (rm == _message) return;
      _message = rm;
      await _handleNotification(rm);
    });
  }
}

class _NotificationModal extends StatefulWidget {
  const _NotificationModal({required this.rm});

  final RemoteMessage rm;

  @override
  State<_NotificationModal> createState() => _NotificationModalState();
}

class _NotificationModalState extends State<_NotificationModal> {
  late FcmController fcmController;
  late KakaoViewModel kakaoViewModel;
  late LocationViewModel locationViewModel;

  @override
  void initState() {
    super.initState();
    fcmController = context.read<FcmController>();
    kakaoViewModel = context.read<KakaoViewModel>();
    locationViewModel = context.read<LocationViewModel>();
    kakaoViewModel.getLocation(locationViewModel.distanceModel!);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(16.r),
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(16.r),
        height: 300.h,
        width: 343.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(widget.rm.notification?.title ?? 'No Title',
                  style: AppTypography.title2B),
            ),
            SizedBox(height: 12.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(widget.rm.notification?.body ?? 'No Body',
                  style:
                      AppTypography.body2R.copyWith(color: AppColor.gray500)),
            ),
            const Spacer(),
            ButtonComponent(
              width: 146.w,
              height: 43.h,
              color: AppColor.gray700,
              child: Text('확인했습니다',
                  style: AppTypography.body2B.copyWith(color: AppColor.white)),
              onTap: () async {
                await fcmController.stopSound();
                print(context.read<KakaoViewModel>().kakaoMapModel!.placeName);
                Get.back();
                if (widget.rm.notification!.title == '졸음이 감지되었습니다.' ||
                    widget.rm.notification!.title == '지금 졸려보여요!') {
                  if (kakaoViewModel.kakaoMapModel != null &&
                      kakaoViewModel.kakaoMapModel!.placeName.isNotEmpty) {
                    Get.dialog(
                      Dialog(
                        insetPadding: EdgeInsets.all(16.r),
                        backgroundColor: Colors.transparent,
                        child: Container(
                          padding: EdgeInsets.all(16.r),
                          height: 500.h,
                          width: 400.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.r)),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                    ' ${kakaoViewModel.kakaoMapModel!.distance}M 반경으로 졸음쉼터를 찾았습니다.',
                                    style: AppTypography.title3B),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 250.h,
                                width: 400.w,
                                child: GoogleMapComponent(
                                  latLng: LatLng(
                                    double.parse(
                                        kakaoViewModel.kakaoMapModel!.y),
                                    double.parse(
                                        kakaoViewModel.kakaoMapModel!.x),
                                  ),
                                ),
                              ),
                              Spacer(),
                              ButtonComponent(
                                width: 220.w,
                                height: 43.h,
                                color: AppColor.main,
                                child: Text(
                                  'KakaoNav으로 이동하기',
                                  style: AppTypography.body2B
                                      .copyWith(color: AppColor.white),
                                ),
                                onTap: () async {
                                  if (await NaviApi.instance
                                      .isKakaoNaviInstalled()) {
                                    log(kakaoViewModel
                                        .kakaoMapModel!.placeName);
                                    await NaviApi.instance.navigate(
                                      destination: Location(
                                          name: kakaoViewModel
                                              .kakaoMapModel!.placeName,
                                          x: kakaoViewModel.kakaoMapModel!.x
                                              .toString(),
                                          y: kakaoViewModel.kakaoMapModel!.y
                                              .toString()),
                                      option: NaviOption(
                                          coordType: CoordType.wgs84),
                                    );
                                  } else {
                                    launchBrowserTab(
                                        Uri.parse(NaviApi.webNaviInstall));
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
