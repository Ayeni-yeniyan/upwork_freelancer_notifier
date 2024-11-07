import 'package:notifyme/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:notifyme/ui/views/home/screens/webview_widget.dart';
import 'package:stacked/stacked.dart';

import '../home_viewmodel.dart';
import '../widgets/job_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => locator<HomeViewModel>(),
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return IndexedStack(
            index: viewModel.index,
            children: [
              const JobListWidget(),
              if (viewModel.upworkActive) const WebviewWidget(), //UpworkWebview
            ],
          );
        });
  }
}
