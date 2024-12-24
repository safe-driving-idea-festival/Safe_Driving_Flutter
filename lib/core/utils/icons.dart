import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class AppIcon {
  static SvgPicture _icon({
    required String path,
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }

  static SvgPicture bluetooth({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/bluetooth/bluetooth.svg', color: color, width: width, height: height);

  static SvgPicture bluetoothDisable({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/bluetooth/bluetooth disable.svg', color: color, width: width, height: height);

  static SvgPicture bluetoothSearching({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/bluetooth/bluetooth searching.svg', color: color, width: width, height: height);

  static SvgPicture bluetoothNo({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/bluetooth/no.svg', color: color, width: width, height: height);

  static SvgPicture blackCar({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/car/black car.svg', color: color, width: width, height: height);

  static SvgPicture defaultCar({
    Color color = Colors.black,
    double width = 180,
    double height = 180,
  }) =>
      _icon(path: 'assets/icons/car/default car.svg', color: color, width: width, height: height);

  static SvgPicture lightCar({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/car/light car.svg', color: color, width: width, height: height);

  static SvgPicture check({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/check/check.svg', color: color, width: width, height: height);

  static SvgPicture close({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/check/close.svg', color: color, width: width, height: height);

  static SvgPicture downArrow({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/direction/down_arrow.svg', color: color, width: width, height: height);

  static SvgPicture forwardArrow({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/direction/forward_arrow.svg', color: color, width: width, height: height);

  static SvgPicture leftArrow({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/direction/left_arrow.svg', color: color, width: width, height: height);

  static SvgPicture rightArrow({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/direction/right_arrow.svg', color: color, width: width, height: height);

  static SvgPicture upArrow({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/direction/up_arrow.svg', color: color, width: width, height: height);

  static SvgPicture backArrowIos({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/direction/back_arrow_ios.svg', color: color, width: width, height: height);

  static SvgPicture forwardArrowIos({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/direction/forward_arrow_ios.svg', color: color, width: width, height: height);

  static SvgPicture bar({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/etc/bar.svg', color: color, width: width, height: height);

  static SvgPicture email({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/etc/email.svg', color: color, width: width, height: height);

  static SvgPicture locationMark({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/etc/location mark.svg', color: color, width: width, height: height);

  static SvgPicture moon({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/etc/moon.svg', color: color, width: width, height: height);

  static SvgPicture speed({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/etc/speed.svg', color: color, width: width, height: height);

  static SvgPicture warning({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/etc/warning.svg', color: color, width: width, height: height);

  static SvgPicture passwordOn({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/password/on.svg', color: color, width: width, height: height);

  static SvgPicture passwordOff({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/password/off.svg', color: color, width: width, height: height);

  static SvgPicture phoneDisable({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/phone/phone_disable.svg', color: color, width: width, height: height);

  static SvgPicture phoneEnable({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/phone/phone_enable.svg', color: color, width: width, height: height);

  static SvgPicture play({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/play/play.svg', color: color, width: width, height: height);

  static SvgPicture playDisable({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/play/play_disable.svg', color: color, width: width, height: height);

  static SvgPicture volumnOff({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/sound/volumn_off.svg', color: color, width: width, height: height);

  static SvgPicture volumnUp({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/sound/volumn_up.svg', color: color, width: width, height: height);

  static SvgPicture tabbarFillAlert({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/tabbar_fill/alert.svg', color: color, width: width, height: height);

  static SvgPicture tabbarFillHome({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/tabbar_fill/home.svg', color: color, width: width, height: height);

  static SvgPicture tabbarFillMusic({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/tabbar_fill/music.svg', color: color, width: width, height: height);

  static SvgPicture tabbarFillProfile({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/tabbar_fill/profile.svg', color: color, width: width, height: height);

  static SvgPicture tabbarOutlineAlert({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/tabbar_outline/alert.svg', color: color, width: width, height: height);

  static SvgPicture tabbarOutlineHome({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/tabbar_outline/home.svg', color: color, width: width, height: height);

  static SvgPicture tabbarOutlineMusic({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/tabbar_outline/music.svg', color: color, width: width, height: height);

  static SvgPicture tabbarOutlineProfile({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/tabbar_outline/profile.svg', color: color, width: width, height: height);

  static SvgPicture battery({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/battery.svg', color: color, width: width, height: height);

  static SvgPicture emergency({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/etc/emergency.svg', color: color, width: width, height: height);

  static SvgPicture group({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/group.svg', color: color, width: width, height: height);

  static SvgPicture seat({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/seat.svg', color: color, width: width, height: height);

  static SvgPicture logo({
    Color color = Colors.black,
    double width = 208,
    double height = 67,
  }) {
    return SvgPicture.asset(
      'assets/images/logo.svg',
      width: width,
      height: height,
    );
  }

  static SvgPicture plus({
    Color color = Colors.black,
    double width = 24,
    double height = 24,
  }) =>
      _icon(path: 'assets/icons/plus.svg', color: color, width: width, height: height);

  static SvgPicture googleLogin({
    Color color = Colors.black,
    double width = 343,
    double height = 48,
  }) {
    return SvgPicture.asset(
      'assets/images/google login.svg',
      width: width,
      height: height,
    );
  }
}