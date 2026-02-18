import 'package:flutter/material.dart';
import 'package:memory_card/widgets/HomeButton.dart';
import 'package:memory_card/widgets/SettingsDialog.dart';
import 'package:provider/provider.dart';

import '../provider/HomeProvider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
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
                      text: '2x2',
                      callback: () {
                        homeProvider.buttonClickSound();
                      },
                    ),
                    HomeButton(
                      text: '4x4',
                      callback: () {
                        homeProvider.buttonClickSound();
                      },
                    ),
                    HomeButton(
                      text: '6x6',
                      callback: () {
                        homeProvider.buttonClickSound();
                      },
                    ),
                    HomeButton(
                      text: '8x8',
                      callback: () {
                        homeProvider.buttonClickSound();
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
    );
  }
}
