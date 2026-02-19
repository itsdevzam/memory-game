import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../provider/HomeProvider.dart';
import 'MyButton.dart';
import 'MyText.dart';

void closeDialog({required BuildContext context, required bool isHome}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "",
    barrierColor: Colors.black.withOpacity(0.7),
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue.withAlpha(100),
          image: const DecorationImage(
            image: AssetImage("assets/icons/square.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.lightBlue, BlendMode.srcATop),
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black54, width: 1.5),
        ),
        width: 350,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyText(text: "Are you sure?", fontSize: 38),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                  text: "Yes",
                  callback: () {
                    isHome
                        ? Navigator.pushNamed(context, 'home')
                        : SystemNavigator.pop();
                  },
                ),
                MyButton(
                  text: "No",
                  callback: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    ),
    transitionBuilder: (_, animation, __, child) {
      return ScaleTransition(
        scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
        child: child,
      );
    },
  );
}
