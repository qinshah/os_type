import 'package:flutter_test/flutter_test.dart';
import 'package:os_type/os_type.dart';
import 'package:os_type/os_type_platform_interface.dart';
import 'package:os_type/os_type_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOsTypePlatform
    with MockPlatformInterfaceMixin
    implements OsTypePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final OsTypePlatform initialPlatform = OsTypePlatform.instance;

  test('$MethodChannelOsType is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOsType>());
  });

  test('getPlatformVersion', () async {
    OsType osTypePlugin = OsType();
    MockOsTypePlatform fakePlatform = MockOsTypePlatform();
    OsTypePlatform.instance = fakePlatform;

    expect(await osTypePlugin.getPlatformVersion(), '42');
  });
}
