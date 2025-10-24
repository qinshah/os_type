
import 'os_type_platform_interface.dart';

class OsType {
  Future<String?> getPlatformVersion() {
    return OsTypePlatform.instance.getPlatformVersion();
  }
}
