import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //画面向き指定
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp, //縦固定
    ],
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarot',
      theme: ThemeData.dark(useMaterial3: false),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
