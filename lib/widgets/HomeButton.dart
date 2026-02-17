import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/Constants.dart';

class HomeButton extends StatelessWidget {
  String text;
  VoidCallback callback;
  bool? showIcon;

  HomeButton({
    super.key,
    this.showIcon = true,
    required this.text,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        width: Constants.getWidth(context) * 0.7,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/icons/square.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.lightBlue, BlendMode.srcATop),
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black54, width: 1.5),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          splashColor: Colors.white.withOpacity(0.3),
          highlightColor: Colors.white.withOpacity(0.15),
          onTap: callback,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(showIcon!)Image.asset('assets/icons/card.png', width: 70, height: 70),
                const SizedBox(width: 12),

                // Your outlined text
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      text,
                      style: GoogleFonts.gamjaFlower(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 4
                          ..color = Colors.black54,
                      ),
                    ),
                    Text(
                      text,
                      style: GoogleFonts.gamjaFlower(
                        fontSize: 48,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
