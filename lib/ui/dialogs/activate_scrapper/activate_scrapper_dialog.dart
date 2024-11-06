import 'package:flutter/material.dart';
import 'package:notifyme/app/app.locator.dart';
import 'package:notifyme/core/models/svgs.dart';
import 'package:notifyme/ui/common/ui_helpers.dart';
import 'package:notifyme/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'activate_scrapper_dialog_model.dart';

const double _graphicSize = 60;

class ActivateScrapperDialog extends StackedView<ActivateScrapperDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ActivateScrapperDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ActivateScrapperDialogModel viewModel,
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
            verticalSpaceMedium,
            GestureDetector(
              onTap: () {
                completer(DialogResponse(confirmed: true));
                locator<HomeViewModel>().toggleUpworkActive(true);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  locator<HomeViewModel>().upworkActive
                      ? 'Deactivate Upwork'
                      : 'Activate Upwork',
                  style: const TextStyle(
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
  ActivateScrapperDialogModel viewModelBuilder(BuildContext context) =>
      ActivateScrapperDialogModel();
}
