import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memory_card/screen/HomeScreen.dart';
import 'package:provider/provider.dart';

import '../provider/SplashProvider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

late AnimationController _controller;
late final Animation<double> _scaleAnimation;

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

    final splashProvider = Provider.of<SplashProvider>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg/bg_blue.png"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [

            ScaleTransition(
              scale: _scaleAnimation,
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(10),
                child: Image.asset(
                  "assets/icons/logo.png",
                  width: 160,
                  height: 160,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );
    _controller.forward();
    if(_controller.isCompleted){
      _controller = AnimationController(
        duration: const Duration(milliseconds: 800),
        vsync: this,
      );
      _controller.forward();
    }
    Timer(const Duration(milliseconds: 2500), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0); // slide from right
            const end = Offset.zero;
            const curve = Curves.easeOutCubic;

            final tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve),
            );

            final offsetAnimation = animation.drive(tween);

            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: offsetAnimation,
                child: child,
              ),
            );

          },
        ),
      );
    });
  }
}
