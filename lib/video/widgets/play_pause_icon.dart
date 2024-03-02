import 'package:flutter/material.dart';

class AnimatedPlayPauseIcon extends StatefulWidget {
  const AnimatedPlayPauseIcon({Key? key, required this.playState})
      : super(key: key);

  // Pass the initial state (play or pause)
  final bool playState;

  @override
  State<AnimatedPlayPauseIcon> createState() => _AnimatedPlayPauseIconState();
}

class _AnimatedPlayPauseIconState extends State<AnimatedPlayPauseIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    if (widget.playState) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  void didUpdateWidget(AnimatedPlayPauseIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.playState) {
      // If the playState changes, update the animation accordingly
      setState(() {
        controller.forward();
      });
    } else {
      setState(() {
        controller.reverse();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedIcon(
      size: 50,
      icon: AnimatedIcons.play_pause,
      progress: animation,
    );
  }
}
