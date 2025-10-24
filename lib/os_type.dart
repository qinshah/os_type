import 'package:flutter/foundation.dart';

import 'src/os_type_platform_interface.dart';

abstract class OsType {
  static bool deviceTypeinitialized = false;

  static Future<void> initDeviceType() async {
    _deviceType = await OsTypePlatform.instance.getDeviceType();
    deviceTypeinitialized = true;
  }

  static final os = defaultTargetPlatform;

  static late final String? _deviceType;

  static final bool isAndroid = os == TargetPlatform.android;

  static final bool isFuchsia = os == TargetPlatform.fuchsia;

  static final bool isIOS = os == TargetPlatform.iOS;

  static final bool isLinux = os == TargetPlatform.linux;

  static final bool isMacOS = os == TargetPlatform.macOS;

  static final bool isWindows = os == TargetPlatform.windows;

  static final bool isHarmony = os.toString() == 'TargetPlatform.ohos';

  static final bool isWeb = kIsWeb;

  static final bool isPC = _isPc();

  static final bool isMobile = !isPC;

  static final bool isHarmonyPC = _isHarmonyPC();

  static bool _isHarmonyPC() {
    if (!isHarmony) return false;
    assert(!kIsWeb, '在鸿蒙web中无法判断是否为鸿蒙PC');
    assert(
      deviceTypeinitialized,
      '在鸿蒙中判断是否为PC请先调用OsType.initDeviceType()进行初始化',
    );
    return _deviceType == '2in1';
  }

  static bool _isPc() {
    switch (os) {
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return true;
      default:
        if (isHarmony) return isHarmonyPC;
        // 默认其它系统不属于PC，但目前至少fuchsia是不清楚的
        return false;
    }
  }
}
