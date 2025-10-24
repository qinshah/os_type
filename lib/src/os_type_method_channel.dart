import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'os_type_platform_interface.dart';

class MethodChannelOsType extends OsTypePlatform {
  MethodChannelOsType() {
    methodChannel.setMethodCallHandler((call) => _handleMethodCall(call));
  }

  @visibleForTesting
  final methodChannel = const MethodChannel('os_type');

  Future<void> _handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'set device type':
        return;
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details: 'os_type for ${call.method} is not implemented',
        );
    }
  }
}
