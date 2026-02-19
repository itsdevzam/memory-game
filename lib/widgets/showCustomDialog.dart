import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memory_card/provider/HomeProvider.dart';
import 'package:provider/provider.dart';

import 'MyButton.dart';
import 'MyText.dart';

void showCustomDialog({required BuildContext context}) {
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
            MyText(text: "Custom", fontSize: 38),
            SizedBox(height: 20),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) => Row(
                children: [
                  Expanded(
                    child: CupertinoPicker.builder(
                      itemExtent: 50,
                      onSelectedItemChanged: (value) =>
                      homeProvider.selectCustomRow = homeProvider.customRows[value],
                      itemBuilder: (context, index) {
                        return MyText(
                          text: homeProvider.customRows[index].toString(),
                          fontSize: 40,
                        );
                      },
                      childCount: homeProvider.customRows.length,
                    ),
                  ),
                  MyText(text: 'X', fontSize: 40),
                  Expanded(
                    child: CupertinoPicker.builder(
                      itemExtent: 50,
                      onSelectedItemChanged: (value) =>
                      homeProvider.selectCustomColumn = homeProvider.customColumns[value],
                      itemBuilder: (context, index) {
                        return MyText(
                          text: homeProvider.customColumns[index].toString(),
                          fontSize: 40,
                        );
                      },
                      childCount: homeProvider.customColumns.length,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text("Note: Select Multiple of 2",style: GoogleFonts.abel(fontSize: 20),),
            SizedBox(height: 20),
            MyButton(
              text: "Start",
              callback: () => context.read<HomeProvider>().selectCustomCard(
                context: context,
                rows: context.read<HomeProvider>().selectCustomRow,
                columns: context.read<HomeProvider>().selectCustomColumn,
              ),
            ),
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
