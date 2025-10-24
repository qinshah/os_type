import 'package:flutter/foundation.dart';

import 'src/os_type_platform_interface.dart';

abstract class OsType {
  static final _osTypePlatform = OsTypePlatform.instance;
  static final _os = defaultTargetPlatform;

  static final bool isAndroid = _os == TargetPlatform.android;

  static final bool isFuchsia = _os == TargetPlatform.fuchsia;

  static final bool isIOS = _os == TargetPlatform.iOS;

  static final bool isLinux = _os == TargetPlatform.linux;

  static final bool isMacOS = _os == TargetPlatform.macOS;

  static final bool isWindows = _os == TargetPlatform.windows;

  static final bool isHarmony = _os.toString() == 'TargetPlatform.ohos';

  static final bool isWeb = kIsWeb;

  static final bool isPC = _isPc();

  static final bool isMobile = !isPC;

  static final bool isHarmonyPC = _isHarmonyPC();

  static bool _isHarmonyPC() {
    if (!isHarmony) {
      return false;
    } else if (isWeb) {
      throw Exception('在鸿蒙web中无法判断是否为鸿蒙PC');
    }
    return _osTypePlatform.isPC;
  }

  static bool _isPc() {
    switch (_os) {
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
