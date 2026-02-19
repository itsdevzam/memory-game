import 'package:flutter/material.dart';
import 'package:memory_card/screen/GameScreen.dart';
import 'package:memory_card/widgets/HomeButton.dart';
import 'package:memory_card/widgets/SettingsDialog.dart';
import 'package:memory_card/widgets/closeDialog.dart';
import 'package:memory_card/widgets/showCustomDialog.dart';
import 'package:provider/provider.dart';

import '../provider/HomeProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if(didPop) return;
        closeDialog(context: context,isHome: false);
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg/bg_blue.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 80),
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Image.asset(
                    'assets/icons/logo.png',
                    width: 130,
                    height: 130,
                  ),
                ),
                SizedBox(height: 50),
                SingleChildScrollView(
                  child: Column(
                    spacing: 15,
                    children: [
                      HomeButton(
                        text: '3x2',
                        callback: () {
                          homeProvider.buttonClickSound();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen(rows: 3, columns: 2),));
                        },
                      ),
                      HomeButton(
                        text: '4x3',
                        callback: () {
                          homeProvider.buttonClickSound();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen(rows: 4, columns: 3),));
                        },
                      ),
                      HomeButton(
                        text: '6x4',
                        callback: () {
                          homeProvider.buttonClickSound();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen(rows: 6, columns: 4),));
                        },
                      ),
                      HomeButton(
                        text: 'Custom',
                        callback: () {
                          homeProvider.buttonClickSound();
                          homeProvider.setInitialValues();
                          showCustomDialog(context: context);
                        },
                      ),
                      HomeButton(
                        text: 'Settings',
                        showIcon: false,
                        callback: () {
                          homeProvider.buttonClickSound();
                          showSettingsDialog(context: context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
