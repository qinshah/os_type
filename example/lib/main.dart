import 'package:flutter/material.dart';
import 'package:os_type/os_type.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (OsType.isHarmony) await OsType.initDeviceType();
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
              for (var os in TargetPlatform.values) ...[
                Text('Is ${os.toString().split('.').last}: ${OsType.os == os}'),
                SizedBox(height: 8),
              ],
              SizedBox(height: 20),
              Text('PC or Mobile: ${OsType.isPC ? 'PC' : 'Mobile'}'),
              SizedBox(height: 8),
              Text('Web: ${OsType.isWeb}'),
              SizedBox(height: 8),
              Text('Harmony PC: ${OsType.isHarmonyPC}'),
            ],
          ),
        ),
      ),
    );
  }
}
