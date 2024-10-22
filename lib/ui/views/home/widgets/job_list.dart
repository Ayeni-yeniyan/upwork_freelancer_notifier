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
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Job List',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // const SizedBox(height: 10),
                const Text(
                  'Get the latest job updates on your Upwork right here, right now.',
                  style: TextStyle(fontSize: 12),
                ),
                // const Text(
                //   'sort by | Time',
                //   style: TextStyle(fontSize: 12),
                // ), //payment verified,amount spent,budget
                const SizedBox(height: 15),
                const SearchWidget(),
                const SizedBox(height: 15),
                Expanded(
                  child: ListView.separated(
                    itemCount: viewModel.jobsList.isEmpty
                        ? 0
                        : viewModel.jobsList.length,
                    itemBuilder: (context, index) => JobTile(
                      viewModel.jobsList[index],
                    ),
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

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: AppPallete.jobTileColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(
            Icons.search,
          ),
          hintText: 'Search jobs...'),
    );
  }
}
