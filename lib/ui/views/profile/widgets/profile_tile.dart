import 'package:flutter/material.dart';
import 'package:notifyme/core/theme/app_decoration.dart';
import 'package:notifyme/ui/common/ui_helpers.dart';

class ProfileTile extends StatelessWidget {
  final String text;
  final Color? iconColor;
  final IconData? leading;
  final Widget? widget;
  final VoidCallback? action;

  const ProfileTile({
    super.key,
    required this.text,
    this.leading,
    this.action,
    this.iconColor,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(5),
          child: Container(
            decoration: AppDecoration.jobTileDecor.copyWith(
              color: Theme.of(context).cardColor,
            ),
            alignment: Alignment.center,
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                if (leading != null)
                  Icon(
                    leading!,
                    color: iconColor,
                  ),
                if (leading != null) horizontalSpaceSmall,
                Text(
                  text,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                widget ?? const Icon(Icons.keyboard_arrow_right_rounded),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
