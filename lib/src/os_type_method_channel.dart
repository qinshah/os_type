import 'package:flutter/services.dart';

import 'os_type_platform_interface.dart';

class MethodChannelOsType extends OsTypePlatform {
  final methodChannel = const MethodChannel('os_type');

  @override
  Future<String?> getDeviceType() async {
    return await methodChannel.invokeMethod<String>('getDeviceType');
  }
}
