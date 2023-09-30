import 'package:calculator/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Homepage(),
      scrollBehavior: MyScrollBarBehavious(),
    );
  }
}

class MyScrollBarBehavious extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
      };
}
