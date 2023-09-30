import 'package:flutter/material.dart';

const url = "https://openexchangerates.org/api/latest.json?app_id=5f6af9bd37284e43b7307d7e30d9b0b8&base=USD";
const title = "Welcome to ";
const appname = "Exchango";
const subtitle = "Your Currency Converter Companion";
const Color blue = Color(0xFF3F3D56);
const Color lightblue = Color(0xFFB2ABFF);
const String worldUrl = "assets/world.png";
const String swapUrl = "assets/swap.png";
TextStyle getStyle(double size, {String weight = 'l', String color = 'b'}) {
  FontWeight fw;
  Color c;

  switch (color) {
    case 'b':
      c = blue;
      break;
    case 'lb':
      c = lightblue;
      break;
    case 'w':
      c = Colors.white;
      break;
    default:
      c = Colors.black;
      break;
  }

  switch (weight) {
    case 'l':
      fw = FontWeight.w300;
      break;
    case 'm':
      fw = FontWeight.w500;
      break;
    case 'b':
      fw = FontWeight.w700;
      break;
    case 'r':
      fw = FontWeight.w400;
      break;
    default:
      fw = FontWeight.w400;
      break;
  }
  return TextStyle(color: c, fontFamily: "Inter", fontWeight: fw, fontSize: size);
}
