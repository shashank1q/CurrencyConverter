import 'package:currency_converter/screens/desktop_screen.dart';
import 'package:currency_converter/screens/mobile_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const CurrencyConverterApp());
}

class CurrencyConverterApp extends StatelessWidget {
  const CurrencyConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Exchango: Currency converter",
      home: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 1000) {
            return MobilePage(
              width: constraints.maxWidth,
            );
          }
          return DesktopPage(
            width: constraints.maxWidth,
          );
        },
      ),
    );
  }
}
