import 'package:flutter/material.dart';
import 'package:notifyme/core/app_strings.dart';
import 'package:notifyme/core/models/svgs.dart';
import 'package:notifyme/core/theme/app_pallete.dart';
import 'package:notifyme/ui/common/app_colors.dart';
import 'package:notifyme/ui/common/ui_helpers.dart';
import 'package:notifyme/ui/views/shared/screens/webview_screen.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'sign_in_upwork_dialog_model.dart';

const double _graphicSize = 60;

class SignInUpworkDialog extends StackedView<SignInUpworkDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const SignInUpworkDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignInUpworkDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Images.notifyMEIcon,
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 10),
            Text(
              'You need to login to your Upwork!',
              style: TextStyle(
                color: AppPallete.black,
                fontSize: 16,
              ),
            ),
            verticalSpaceMedium,
            GestureDetector(
              onTap: () {
                completer(DialogResponse(confirmed: true));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebviewScreen(
                      webLink: AppStrings.upworkRecent,
                      isLogin: true,
                    ),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SignInUpworkDialogModel viewModelBuilder(BuildContext context) =>
      SignInUpworkDialogModel();
}
