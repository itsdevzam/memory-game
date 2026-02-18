import 'package:flutter/material.dart';

import 'MyText.dart';

class MyButton extends StatelessWidget {
  String text;
  double fontSize;
  double width;
  bool isIcon;
  IconData iconData;
  Color iconColor;
  double height;
  VoidCallback callback;

  MyButton({
    super.key,
    this.iconData = Icons.star_rounded,
    this.isIcon = false,
    this.iconColor = Colors.yellow,
    required this.callback,
    required this.text,
    this.fontSize = 28,
    this.width = 120,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: callback,
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.white.withOpacity(0.3),
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withAlpha(150),
                Colors.lightBlue.withOpacity(0.8),
              ],
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black54, width: 1.5),
          ),
          child: Row(
            mainAxisAlignment: .center,
            children: [
              if (isIcon) ...[
                Icon(iconData, color: iconColor),
                if (text.isNotEmpty) SizedBox(width: 5),
              ],
              MyText(text: text, fontSize: fontSize),
            ],
          ),
        ),
      ),
    );
  }
}
