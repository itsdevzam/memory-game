import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  String text;
  double fontSize;
  double letterSpacing;
  bool isOutline;
  MyText({super.key,this.isOutline=true,required this.text, required this.fontSize,this.letterSpacing=2});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if(isOutline)
        Text(
          text,
          style: GoogleFonts.gamjaFlower(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            letterSpacing: letterSpacing,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3
              ..color = Colors.black54,
          ),
        ),
        Text(
          text,
          style: GoogleFonts.gamjaFlower(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            letterSpacing: letterSpacing,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
