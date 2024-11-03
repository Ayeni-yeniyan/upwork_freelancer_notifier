import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:notifyme/core/models/svgs.dart';
import 'package:notifyme/core/theme/app_pallete.dart';
import 'package:notifyme/core/theme/app_textstyle.dart';
import 'package:stacked/stacked.dart';
import 'package:notifyme/ui/common/ui_helpers.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({super.key});

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(),
          const Spacer(),
          Image.asset(
            Images.notifyMEIcon,
            height: 100,
            width: 100,
          ),
          Text(
            'notifyME',
            style: AppTextstyle.labelTextStyle,
          ),
          const Spacer(),
          SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              color: AppPallete.gold.withOpacity(0.7),
              strokeWidth: 5,
            ),
          ),
          verticalSpaceLarge
        ],
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
