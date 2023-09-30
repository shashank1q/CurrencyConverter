import 'package:currency_converter/utils/constants.dart';
import 'package:currency_converter/widgets/hero_section.dart';
import 'package:currency_converter/widgets/working_section.dart';
import 'package:flutter/material.dart';

class MobilePage extends StatefulWidget {
  final double width;
  const MobilePage({super.key, required this.width});

  @override
  State<MobilePage> createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeroSection(width: widget.width),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(widget.width * 0.1),
              decoration: const BoxDecoration(
                  color: blue, borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(20))),
              child: const WorkingSection(),
            )
          ],
        ),
      ),
    );
  }
}
