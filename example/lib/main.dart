import 'package:flutter/material.dart';
import 'package:os_type/os_type.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (OsType.isHarmony) await OsType.initHarmonyDeviceType();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('os type example')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('is android: ${OsType.isAndroid}'),
              SizedBox(height: 8),
              Text('is fuchsia: ${OsType.isFuchsia}'),
              SizedBox(height: 8),
              Text('is iOS: ${OsType.isIOS}'),
              SizedBox(height: 8),
              Text('is linux: ${OsType.isLinux}'),
              SizedBox(height: 8),
              Text('is macOS: ${OsType.isMacOS}'),
              SizedBox(height: 8),
              Text('is windows: ${OsType.isWindows}'),
              SizedBox(height: 8),
              Text('is ohos: ${OsType.isHarmony}'),
              SizedBox(height: 8),
              // 上面的列举有更简单的写法：
              // for (var os in TargetPlatform.values) ...[
              //   Text('is ${os.name}: ${OsType.os == os}'),
              //   SizedBox(height: 8),
              // ],

              // pc和mobile是相反的，而is web则等于KIsWeb，是独立的判断，与其它无关
              SizedBox(height: 20),
              Text('is PC: ${OsType.isPC}'),
              SizedBox(height: 8),
              Text('is Mobile: ${OsType.isMobile}'), // isMobile == !isPC
              SizedBox(height: 8),
              Text('is Web: ${OsType.isWeb}'), // isWeb == KIsWeb
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
