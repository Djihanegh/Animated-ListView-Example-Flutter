import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

   FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = Tween(begin: 0.0, end: 1.0);

    const duration = Duration(milliseconds: 500);

    return CustomAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: duration,
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: (animation as double),
        child: Transform.translate(offset: Offset(0, animation), child: child),
      ),
    );
  }
}
