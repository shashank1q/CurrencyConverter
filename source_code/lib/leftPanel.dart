// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class leftPanel extends StatelessWidget {
  const leftPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "CALCULATOR",
              style: headingStyle(context),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          width: 600,
          child: Text(
            "A simple calculator made for people who Know how to use a Compter but don't know addition,subtraction, multiplication or division. But don't worry if you have missed your elementary classes I have made this calculator just for you \n so enjoy :) ",
            style: smallTextStyle(context),
            softWrap: true,
            textAlign: TextAlign.center,
            maxLines: 6,
          ),
        ),
      ],
    );
  }

  TextStyle headingStyle(BuildContext context) {
    double size = 60;
    double width = MediaQuery.of(context).size.width;
    if (width < 540) {
      size = 45;
    } else if (width < 600) {
      size = 50;
    } else if (width < 650) {
      size = 55;
    }
    return GoogleFonts.michroma(
        fontSize: size,
        color: Colors.deepPurple[400],
        fontWeight: FontWeight.w500);
  }

  TextStyle smallTextStyle(BuildContext context) {
    double size = 22;
    double width = MediaQuery.of(context).size.width;
    if (width < 340) {
      size = 9;
    } else if (width < 450) {
      size = 11;
    } else if (width < 540) {
      size = 15;
    } else if (width < 600) {
      size = 17;
    } else if (width < 650) {
      size = 20;
    }
    return GoogleFonts.roboto(
        fontSize: size, color: Colors.deepPurple[200], height: 1.4);
  }
}
