import 'package:flutter/foundation.dart';

import 'src/os_type_platform_interface.dart';

abstract class OsType {
  static String? _harmonyDeviceType;
  static Future<void> initHarmonyDeviceType() async {
    if (!isHarmony) {
      _harmonyDeviceType = 'unknown';
      throw Exception('不能也不需要在非鸿蒙系统中获取鸿蒙设备类型');
    }
    if (isWeb) {
      _harmonyDeviceType = 'unknown';
      throw Exception('暂时无法在web上获取鸿蒙设备类型');
    }
    _harmonyDeviceType =
        await OsTypePlatform.instance.getDeviceType() ?? 'unknown';
  }

  static final os = defaultTargetPlatform;

  static final isAndroid = os == TargetPlatform.android;

  static final isFuchsia = os == TargetPlatform.fuchsia;

  static final isIOS = os == TargetPlatform.iOS;

  static final isLinux = os == TargetPlatform.linux;

  static final isMacOS = os == TargetPlatform.macOS;

  static final isWindows = os == TargetPlatform.windows;

  static final isHarmony = os.toString() == 'TargetPlatform.ohos';

  static final isWeb = kIsWeb;

  static final isPC = _isPc();

  static final isMobile = !isPC;

  static bool _isPc() {
    switch (os) {
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return true;
      default:
        if (isHarmony) {
          if (_harmonyDeviceType == null) {
            throw Exception('在鸿蒙上使用isPC/isMobile之前请先initHarmonyDeviceType()');
          }
          return _harmonyDeviceType == '2in1';
        }
        // 默认其它系统不属于PC，但其实至少fuchsia是不清楚的
        return false;
    }
  }
}
