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
      disposeViewModel: false,
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Job List'),
                const Text(
                  'Get the latest job updates on your Upwork right here, right now.',
                ),
                const Text(
                  'sort by | Time',
                ), //payment verified,amount spent,budget
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.separated(
                    itemCount: viewModel.jobsList.isEmpty
                        ? 0
                        : viewModel.jobsList.length,
                    itemBuilder: (context, index) =>
                        JobTile(viewModel.jobsList[index]),
                    separatorBuilder: (context, index) => verticalSpaceSmall,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
