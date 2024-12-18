import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class AppIcon {
  static const double width = 24;
  static const double height = 24;

  static SvgPicture _icon({required String path, Color color = Colors.black}) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      color: color,
    );
  }

  static SvgPicture bluetooth({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/bluetooth/bluetooth.svg', color: color);

  static SvgPicture bluetoothDisable({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/bluetooth/bluetooth disable.svg', color: color);

  static SvgPicture bluetoothSearching({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/bluetooth/bluetooth searching.svg', color: color);

  static SvgPicture bluetoothNo({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/bluetooth/no.svg', color: color);

  static SvgPicture blackCar({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/car/black car.svg', color: color);

  static SvgPicture defaultCar({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/car/default car.svg', color: color);

  static SvgPicture lightCar({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/car/light car.svg', color: color);

  static SvgPicture check({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/check/check.svg', color: color);

  static SvgPicture close({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/check/close.svg', color: color);

  static SvgPicture downArrow({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/direction/down_arrow.svg', color: color);

  static SvgPicture forwardArrow({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/direction/forward_arrow.svg', color: color);

  static SvgPicture leftArrow({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/direction/left_arrow.svg', color: color);

  static SvgPicture rightArrow({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/direction/right_arrow.svg', color: color);

  static SvgPicture upArrow({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/direction/up_arrow.svg', color: color);

  static SvgPicture backArrowIos({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/direction/back_arrow_ios.svg', color: color);

  static SvgPicture forwardArrowIos({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/direction/forward_arrow_ios.svg', color: color);

  static SvgPicture bar({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/etc/bar.svg', color: color);

  static SvgPicture email({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/etc/email.svg', color: color);

  static SvgPicture locationMark({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/etc/location mark.svg', color: color);

  static SvgPicture moon({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/etc/moon.svg', color: color);

  static SvgPicture speed({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/etc/speed.svg', color: color);

  static SvgPicture warning({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/etc/warning.svg', color: color);

  static SvgPicture passwordOn({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/password/on.svg', color: color);

  static SvgPicture passwordOff({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/password/off.svg', color: color);

  static SvgPicture phoneDisable({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/phone/phone_disable.svg', color: color);

  static SvgPicture phoneEnable({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/phone/phone_enable.svg', color: color);

  static SvgPicture play({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/play/play.svg', color: color);

  static SvgPicture playDisable({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/play/play_disable.svg', color: color);

  static SvgPicture volumnOff({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/sound/volumn_off.svg', color: color);

  static SvgPicture volumnUp({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/sound/volumn_up.svg', color: color);

  static SvgPicture tabbarFillAlert({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/tabbar_fill/alert.svg', color: color);

  static SvgPicture tabbarFillHome({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/tabbar_fill/home.svg', color: color);

  static SvgPicture tabbarFillMusic({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/tabbar_fill/music.svg', color: color);

  static SvgPicture tabbarFillProfile({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/tabbar_fill/profile.svg', color: color);

  static SvgPicture tabbarOutlineAlert({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/tabbar_outline/alert.svg', color: color);

  static SvgPicture tabbarOutlineHome({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/tabbar_outline/home.svg', color: color);

  static SvgPicture tabbarOutlineMusic({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/tabbar_outline/music.svg', color: color);

  static SvgPicture tabbarOutlineProfile({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/tabbar_outline/profile.svg', color: color);

  static SvgPicture battery({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/battery.svg', color: color);

  static SvgPicture group({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/group.svg', color: color);

  static SvgPicture seat({Color color = Colors.black}) =>
      _icon(path: 'assets/icons/seat.svg', color: color);

  static SvgPicture logo({Color color = Colors.black}) {
    return SvgPicture.asset(
      'assets/images/logo.svg',
      width: 208,
      height: 67,
    );
  }

  static SvgPicture googleLogin({Color color = Colors.black}) {
    return SvgPicture.asset(
      'assets/images/google login.svg',
      width: 343,
      height: 48,
    );
  }
}