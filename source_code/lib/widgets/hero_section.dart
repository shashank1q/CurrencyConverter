import 'package:currency_converter/utils/constants.dart';
import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  final double width;
  const HeroSection({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(text: title, style: getStyle(width > 270 ? 85 : 36, color: 'bl', weight: 'l'), children: [
              TextSpan(text: appname, style: getStyle(width > 270 ? 85 : 36, color: 'b', weight: 'b')),
            ]),
          ),
          Text(
            subtitle,
            style: getStyle(width > 270 ? 48 : 22, weight: 'l'),
          ),
          Image.asset(
            worldUrl,
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}
