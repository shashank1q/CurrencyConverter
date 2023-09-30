import 'package:currency_converter/utils/constants.dart';
import 'package:currency_converter/widgets/hero_section.dart';
import 'package:currency_converter/widgets/working_section.dart';
import 'package:flutter/material.dart';

class DesktopPage extends StatefulWidget {
  final double width;
  const DesktopPage({super.key, required this.width});

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: HeroSection(width: widget.width),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  )),
              child: const Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
                child: WorkingSection(),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
