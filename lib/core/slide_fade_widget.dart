// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AnimatedSlideFade extends StatelessWidget {
  const AnimatedSlideFade({
    Key? key,
    required this.controller,
    required this.slideInitialPos,
    required this.child,
  }) : super(key: key);
  final AnimationController controller;
  final Offset slideInitialPos;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => SlideTransition(
        position: Tween<Offset>(
          begin: slideInitialPos,
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.decelerate,
          ),
        ),
        child: FadeTransition(
          opacity: CurvedAnimation(
            parent: controller,
            curve: Curves.decelerate,
          ),
          child: child,
        ),
      ),
      child: child,
    );
  }
}
