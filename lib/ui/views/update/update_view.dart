import 'package:flutter/material.dart';
import 'package:notifyme/app/app.locator.dart';
import 'package:notifyme/core/theme/app_textstyle.dart';
import 'package:notifyme/ui/common/ui_helpers.dart';
import 'package:notifyme/ui/views/shared/widgets/base_scaffold.dart';
import 'package:notifyme/ui/views/shared/widgets/general_button.dart';
import 'package:stacked/stacked.dart';

import 'update_viewmodel.dart';
import 'widgets/download_update.dart';

class UpdateView extends StackedView<UpdateViewModel> {
  const UpdateView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UpdateViewModel viewModel,
    Widget? child,
  ) {
    return BaseScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const DownloadAnimation(),
          verticalSpaceSmall,
          Text(
            'Update Available!',
            style: AppTextstyle.labelTextStyle,
          ),
          verticalSpaceLarge,
          Text(
            textAlign: TextAlign.center,
            'Updates are important. '
            'They keep you safe, secured and in sync with the latest features aimed at helping you get the best out of your productive time.',
            style: AppTextstyle.bodyTextStyle,
          ),
          verticalSpaceSmall,
          GeneralButton(
            text: 'Get Update',
            onTap: viewModel.getUpdate,
          ),
          const Spacer(),
          Text(
            '© 2024 notifyME',
            style: AppTextstyle.labelTextStyleSmall,
          ),
        ],
      ),
    );
  }

  @override
  UpdateViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      locator<UpdateViewModel>();
}
