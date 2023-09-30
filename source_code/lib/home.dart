import 'package:flutter/material.dart';
import 'package:calculator/constants.dart';
import 'package:calculator/leftPanel.dart';
import 'package:calculator/rightPanel.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 21, 32),
      body: ScrollbarTheme(
        data: ScrollbarThemeData(
            thumbColor: MaterialStatePropertyAll(Colors.grey.shade700),
            trackBorderColor: const MaterialStatePropertyAll(Colors.black87),
            trackColor: const MaterialStatePropertyAll(Colors.white10),
            thumbVisibility: const MaterialStatePropertyAll(true),
            trackVisibility: const MaterialStatePropertyAll(true),
            mainAxisMargin: 20),
        child: SingleChildScrollView(
          child: Center(
            child: getLayout(),
          ),
        ),
      ),
    );
  }

  Widget getLayout() {
    if (MediaQuery.of(context).size.width < mobileWidth) {
      return const Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [SizedBox(height: 30), leftPanel(), RightPanel()],
      );
    }
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: 20),
        leftPanel(),
        RightPanel(),
      ],
    );
  }
}
