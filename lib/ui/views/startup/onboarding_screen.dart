import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notifyme/core/models/onboarding_model.dart';
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
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
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
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            onboardingContent[index].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          verticalSpaceMedium,
                          Text(
                            onboardingContent[index].subtitle,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                if (index == onboardingContent.length - 1)
                  Positioned(
                      bottom: 20,
                      right: 20,
                      child: GestureDetector(
                        child: IconButton(
                          icon: const Icon(
                            Icons.keyboard_arrow_right_rounded,
                            size: 50,
                          ),
                          onPressed: viewModel.navOnFirstOpen,
                        ),
                      ))
              ],
            ),
          );
        });
  }
}
