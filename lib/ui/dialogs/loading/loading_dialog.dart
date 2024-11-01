import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:notifyme/core/models/svgs.dart';
import 'package:notifyme/core/theme/app_pallete.dart';
import 'package:stacked_services/stacked_services.dart';

class LoadingDialog extends StatefulWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const LoadingDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  State<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 650));
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    SchedulerBinding.instance.addPostFrameCallback(
      (t) {
        controller.addListener(() {
          setState(() {});
        });
        controller.forward();
        controller.addStatusListener((stat) {
          if (stat == AnimationStatus.completed) {
            controller.reverse();
          } else if (stat == AnimationStatus.dismissed) {
            controller.forward();
          }
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Center(
        child: SizedBox(
          height: 85,
          width: 85,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned.fill(
                  child: CircularProgressIndicator(
                color: AppPallete.gold,
              )),
              Opacity(
                opacity: controller.value,
                child: Image.asset(
                  Images.notifyMEIcon,
                  height: 60,
                  width: 60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
