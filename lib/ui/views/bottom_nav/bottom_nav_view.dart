import 'package:flutter/material.dart';
import 'package:notifyme/ui/views/home/screens/home_view.dart';
import 'package:stacked/stacked.dart';

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
      body: [
        const HomeView(),
        Container(
          color: Colors.red,
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        ),
      ][viewModel.selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: RectangleWithCircularCutWidget(),
            ),
            const Positioned(
              bottom: 50,
              child: CircleAvatar(
                radius: 30,
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
    const clr = Colors.lightBlue;
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
