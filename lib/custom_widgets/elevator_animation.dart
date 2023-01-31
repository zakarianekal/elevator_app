import 'package:flutter/material.dart';

class ElevatorAnimation extends StatefulWidget {
  ElevatorAnimation({Key? key}) : super(key: key);

  @override
  State<ElevatorAnimation> createState() => _ElevatorAnimationState();
}

class _ElevatorAnimationState extends State<ElevatorAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInQuint,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: _offsetAnimation,
        child: const Padding(padding: EdgeInsets.all(8.0)));
  }
}
