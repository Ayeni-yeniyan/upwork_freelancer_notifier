import 'package:flutter/material.dart';
import 'package:notifyme/core/models/onboarding_model.dart';
import 'package:notifyme/core/theme/app_pallete.dart';
import 'package:notifyme/ui/common/ui_helpers.dart';
import 'package:notifyme/ui/views/startup/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: ViewModelBuilder<StartupViewModel>.reactive(
        viewModelBuilder: () => StartupViewModel(),
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return Scaffold(
            body: Stack(
              children: [
                PageView.builder(
                  itemCount: onboardingContent.length,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (val) {
                    index = val;
                    setState(() {});
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: index == 0
                                    ? Radius.circular(50)
                                    : Radius.zero,
                                bottomRight: index == 4
                                    ? Radius.circular(50)
                                    : Radius.zero,
                              ),
                              image: DecorationImage(
                                image:
                                    AssetImage(onboardingContent[index].image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                verticalSpaceSmall,
                                Text(
                                  onboardingContent[index].title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                verticalSpaceTiny,
                                Text(
                                  onboardingContent[index].subtitle,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                if (index == onboardingContent.length - 1)
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppPallete.gold.withOpacity(0.5),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            size: 50,
                            color: AppPallete.white,
                          ),
                          onPressed: viewModel.navOnFirstOpen,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 45,
                  left: 20,
                  child: Row(
                    children: List.generate(
                      onboardingContent.length,
                      (ind) => TabIndicatorItem(selected: ind == index),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TabIndicatorItem extends StatelessWidget {
  const TabIndicatorItem({
    super.key,
    required this.selected,
  });
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.medium4,
      height: 10,
      width: selected ? 30 : 15,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: selected ? AppPallete.gold : AppPallete.gold.withOpacity(0.4),
      ),
    );
  }
}
