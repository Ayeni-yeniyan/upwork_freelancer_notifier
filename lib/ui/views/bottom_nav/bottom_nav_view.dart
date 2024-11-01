import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:notifyme/app/app.dialogs.dart';
import 'package:notifyme/app/app.locator.dart';
import 'package:notifyme/core/theme/app_pallete.dart';
import 'package:notifyme/ui/views/home/home_viewmodel.dart';
import 'package:notifyme/ui/views/home/screens/home_view.dart';
import 'package:notifyme/ui/views/profile/profile_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'bottom_nav_viewmodel.dart';
import 'rectangle_painter.dart';

class BottomNavView extends StackedView<BottomNavViewModel> {
  const BottomNavView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BottomNavViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      extendBody: true,
      // bottomSheet: viewModel.bannerAd != null
      //     ? Container(
      //         padding: const EdgeInsets.symmetric(vertical: 10),
      //         child: SizedBox(
      //           width: viewModel.bannerAd!.size.width.toDouble(),
      //           height: viewModel.bannerAd!.size.height.toDouble(),
      //           child: AdWidget(ad: viewModel.bannerAd!),
      //         ),
      //       )
      //     : null,
      body: IndexedStack(
        index: viewModel.selectedIndex,
        children: const [
          HomeView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: RectangleWithCircularCutWidget(
                color:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
              ),
            ),
            Positioned(
              bottom: 50,
              child: ViewModelBuilder<HomeViewModel>.reactive(
                viewModelBuilder: () => locator<HomeViewModel>(),
                disposeViewModel: false,
                builder: (context, homeviewModel, child) {
                  return GestureDetector(
                    onTap: () {
                      locator<DialogService>().showCustomDialog(
                        variant: DialogType.activateScrapper,
                      );
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppPallete.white.withOpacity(0.3),
                          width: 4,
                        ),
                        color: (homeviewModel.upworkActive
                                ? AppPallete.green
                                : AppPallete.red)
                            .withOpacity(0.5),
                      ),
                      child: homeviewModel.upworkActive
                          ? const Icon(
                              Icons.power_settings_new,
                              size: 32,
                            )
                          : Transform.rotate(
                              angle: pi,
                              child: const Icon(
                                Icons.power_settings_new,
                                size: 32,
                              ),
                            ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _BottomNavIcon(
                    icon: Icons.home_outlined,
                    title: 'Home',
                    selected: viewModel.selectedIndex == 0,
                    onTap: () => viewModel.changeIndex(0),
                  ),
                  const SizedBox(width: 80),
                  _BottomNavIcon(
                    icon: Icons.person_2_outlined,
                    title: 'Profile',
                    selected: viewModel.selectedIndex == 1,
                    onTap: () => viewModel.changeIndex(1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  BottomNavViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BottomNavViewModel();

  // @override
  // void onViewModelReady(BottomNavViewModel viewModel) =>
  //     SchedulerBinding.instance
  //         .addPostFrameCallback((timeStamp) => viewModel.loadAds());
}

class _BottomNavIcon extends StatelessWidget {
  final bool selected;
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const _BottomNavIcon({
    required this.icon,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final clr = AppPallete.purple;
    const sclr = Colors.grey;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: 100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: selected ? clr : sclr,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 3,
                ),
                decoration: selected
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: clr,
                      )
                    : null,
                child: Text(
                  title,
                  style: TextStyle(color: selected ? Colors.white : sclr),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
