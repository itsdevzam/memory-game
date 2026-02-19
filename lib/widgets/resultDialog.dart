import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memory_card/provider/GameProvider.dart';
import 'package:provider/provider.dart';
import '../provider/HomeProvider.dart';
import 'MyButton.dart';
import 'MyText.dart';

void resultDialog({
  required BuildContext context,
  required bool isCompleted,
  required int coins,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
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
            MyText(
              text: isCompleted ? "Congratulations!" : "Game Over",
              fontSize: 38,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(text: "Coins Earned", fontSize: 30),
                MyText(text: coins.toString(), fontSize: 30),
              ],
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(text: isCompleted?"Go Next":"Retry", callback: () {
                  context.read<GameProvider>().retry(context: context);
                  Navigator.pop(context);
                }),
                MyButton(
                  text: "Home",
                  callback: () => Navigator.pushNamed(context, 'home'),
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
