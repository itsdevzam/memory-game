import 'package:flutter/material.dart';
import 'package:memory_card/provider/HomeProvider.dart';
import 'package:memory_card/widgets/MyButton.dart';
import 'package:memory_card/widgets/MyText.dart';
import 'package:provider/provider.dart';

void showSettingsDialog({required BuildContext context}) {
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
            MyText(text: "Settings", fontSize: 38),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(text: "Sound", fontSize: 30),
                Consumer<HomeProvider>(
                  builder: (context, homeProvider, child) {
                    return Switch(
                      activeThumbColor: Colors.lightBlue,
                      activeTrackColor: Colors.white,
                      value: homeProvider.sound,
                      onChanged: (val) => homeProvider.sound = val,
                    );
                  },
                ),
              ],
            ),

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(text: "Music", fontSize: 30),
                Consumer<HomeProvider>(
                  builder: (context, homeProvider, child) {
                    return Switch(
                      activeThumbColor: Colors.lightBlue,
                      activeTrackColor: Colors.white,
                      value: homeProvider.music,
                      onChanged: (val) => homeProvider.music = val,
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(text: "Rate Us", callback: () {}),
                MyButton(text: "Share", callback: () {}),
              ],
            ),
            SizedBox(height: 20),
            MyButton(text: "Close", callback: () => Navigator.pop(context)),
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
