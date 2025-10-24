import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'os_type_platform_interface.dart';

/// An implementation of [OsTypePlatform] that uses method channels.
class MethodChannelOsType extends OsTypePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('os_type');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
