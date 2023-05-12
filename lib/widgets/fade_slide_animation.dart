import 'package:flutter/cupertino.dart';

class FadeSlideAnimation extends StatelessWidget {
  final Widget? child;
  final AnimationController animationController;
  final AnimationController? fadeAnimation;
  final int index;
  final CurvedAnimation? curve;
  const FadeSlideAnimation({
    Key? key,
    this.child,
    this.curve,
    this.fadeAnimation,
    required this.index,
    required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position:
          Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval(index * 0.1, (index * 0.1) + .4,
              curve: Curves.easeInOut),
        ),
      ),
      child: FadeTransition(
        opacity: fadeAnimation ?? animationController,
        child: child,
      ),
    );
  }
}
