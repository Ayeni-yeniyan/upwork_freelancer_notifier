import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DownloadAnimation extends StatefulWidget {
  const DownloadAnimation({
    super.key,
  });

  @override
  State<DownloadAnimation> createState() => _DownloadAnimationState();
}

class _DownloadAnimationState extends State<DownloadAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<Alignment> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _animation = Tween<Alignment>(
            end: Alignment.bottomCenter, begin: Alignment.topCenter)
        .animate(_controller);
    SchedulerBinding.instance.addPostFrameCallback((tStamp) {
      _controller.repeat(reverse: true);
      _controller.addListener(
        () => setState(() {}),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Align(
        alignment: _animation.value,
        child: const FaIcon(
          FontAwesomeIcons.download,
          size: 120,
        ),
      ),
    );
  }
}
