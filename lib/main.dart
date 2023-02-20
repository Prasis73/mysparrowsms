import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'splash.dart';

void main() async {
  await GetStorage.init();


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
    return const MaterialApp(
            title: 'PartPurja',
            debugShowCheckedModeBanner: false,
            home: Splash(),
          );
  }
}