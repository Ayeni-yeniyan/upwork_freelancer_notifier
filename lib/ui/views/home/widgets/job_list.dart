import 'package:flutter/material.dart';
import 'package:notifyme/app/app.locator.dart';
import 'package:notifyme/core/theme/app_pallete.dart';
import 'package:notifyme/ui/common/ui_helpers.dart';
import 'package:notifyme/ui/views/home/home_viewmodel.dart';
import 'package:notifyme/ui/views/shared/widgets/base_scaffold.dart';
import 'package:stacked/stacked.dart';

import 'expandable_job_tile.dart';

class JobListWidget extends StatelessWidget {
  const JobListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => locator<HomeViewModel>(),
      builder: (context, viewModel, child) {
        return BaseScaffold(
          appBar: AppBar(
            title: const Text('Job List'),
          ),
          body: ListView.separated(
            itemCount:
                viewModel.jobsList.isEmpty ? 0 : viewModel.jobsList.length,
            itemBuilder: (context, index) =>
                ExpandableJobTile(viewModel.jobsList[index]),
            separatorBuilder: (context, index) => verticalSpaceTiny,
          ),
        );
      },
    );
  }
}
