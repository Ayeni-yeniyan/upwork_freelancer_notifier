import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notifyme/ui/views/home/screens/webview_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:notifyme/core/theme/app_pallete.dart';
import 'package:notifyme/ui/views/shared/widgets/base_scaffold.dart';

import '../home_viewmodel.dart';
import '../widgets/job_list.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: IndexedStack(
        index: viewModel.index,
        children: const [
          JobListWidget(),
          WebviewWidget(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.changeIndex,
        backgroundColor: AppPallete.green,
        child: const FaIcon(FontAwesomeIcons.firefoxBrowser),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
