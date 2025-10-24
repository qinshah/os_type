import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'os_type_method_channel.dart';

abstract class OsTypePlatform extends PlatformInterface {
  OsTypePlatform() : super(token: _token);
  static final Object _token = Object();

  static OsTypePlatform _instance = MethodChannelOsType();

  /// The default instance of [OsTypePlatform] to use.
  ///
  /// Defaults to [MethodChannelOsType].
  static OsTypePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OsTypePlatform] when
  /// they register themselves.
  static set instance(OsTypePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getDeviceType();
}
