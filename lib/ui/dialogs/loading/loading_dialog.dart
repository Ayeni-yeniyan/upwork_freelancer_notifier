import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class LoadingDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const LoadingDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
