import 'package:flutter/material.dart';
import 'package:notifyme/core/theme/app_pallete.dart';
import 'package:notifyme/core/theme/app_textstyle.dart';

class GeneralButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const GeneralButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppPallete.black,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: onTap,
      child: Text(
        text,
        style: AppTextstyle.buttonTextStyle,
      ),
    );
  }
}
