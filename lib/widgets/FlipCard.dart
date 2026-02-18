import 'dart:math';
import 'package:flutter/material.dart';

class FlipCard extends StatefulWidget {
  final bool isFlipped;
  final Widget front;
  final Widget back;

  const FlipCard({
    super.key,
    required this.isFlipped,
    required this.front,
    required this.back,
  });

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: pi).animate(_controller);
  }

  @override
  void didUpdateWidget(covariant FlipCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isFlipped) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final isUnder = _animation.value > pi / 2;

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(_animation.value),
          child: isUnder
              ? Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(pi),
            child: widget.front,
          )
              : widget.back,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
