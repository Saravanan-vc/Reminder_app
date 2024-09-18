import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/provide.dart';
import 'package:todoapp/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  box = await Hive.openBox("mybox");
  Get.put(Provide());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: Splashscreen(),
    );
  }
}
