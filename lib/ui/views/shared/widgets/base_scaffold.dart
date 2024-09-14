import 'package:flutter/material.dart';
import 'package:notifyme/core/theme/app_pallete.dart';

/// [BaseScaffold] extends Scaffold with additional property of displaying
/// a modal that prevents user interaction by setting [blockUserInteraction] to true.
/// Set content padding with [padding].
class BaseScaffold extends StatelessWidget {
  final bool blockUserInteraction;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;
  final EdgeInsetsGeometry padding;
  const BaseScaffold({
    super.key,
    this.blockUserInteraction = false,
    this.appBar,
    this.floatingActionButton,
    required this.body,
    this.padding = const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      body: Stack(
        children: [
          Padding(
            padding: padding,
            child: body,
          ),
          if (blockUserInteraction)
            Positioned.fill(
              child: Material(
                color: AppPallete.grey.withOpacity(0.5),
                child: const Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      ),
    );
  }
}
