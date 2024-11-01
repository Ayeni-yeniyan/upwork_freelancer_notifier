import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:notifyme/app/app.bottomsheets.dart';
import 'package:notifyme/app/app.dialogs.dart';
import 'package:notifyme/app/app.locator.dart';
import 'package:notifyme/core/models/svgs.dart';
import 'package:notifyme/core/theme/app_pallete.dart';
import 'package:notifyme/ui/common/ui_helpers.dart';
import 'package:notifyme/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'job_tile.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Job List',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (viewModel.upworkActive)
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Positioned.fill(
                                child: CircularProgressIndicator(
                              color: AppPallete.green,
                            )),
                            Image.asset(
                              getThemeManager(context).isDarkMode
                                  ? Images.upworkLogo
                                  : Images.upworkLogoBlack,
                              width: 30,
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                  ],
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
                if (viewModel.jobsList.isNotEmpty) const SearchWidget(),
                const SizedBox(height: 15),
                if (!viewModel.upworkActive)
                  const Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'You have not activated the Upwork service.',
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                if (viewModel.upworkActive)
                  Expanded(
                    child: viewModel.jobsList.isEmpty
                        ? Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              viewModel.searchCtrl.text.isNotEmpty
                                  ? 'No job matches the search word ${viewModel.searchCtrl.text}'
                                  : 'You have no jobs.',
                            ),
                          )
                        : ListView.separated(
                            itemCount: viewModel.jobsList.length,
                            itemBuilder: (context, index) => JobTile(
                              viewModel.jobsList[index],
                            ),
                            separatorBuilder: (context, index) {
                              // if ((index + 1) % 4 == 0) {
                              //   return const AdContainer();
                              // } else {
                              return verticalSpaceTiny;
                              // }
                            },
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

class AdContainer extends StatefulWidget {
  const AdContainer({
    super.key,
  });

  @override
  State<AdContainer> createState() => _AdContainerState();
}

class _AdContainerState extends State<AdContainer> {
  bool _addLoaded = false;
  NativeAd? _nativeAd;
  NativeAd? get nativeAds {
    if (_addLoaded) {
      return _nativeAd;
    } else {
      return null;
    }
  }

  void loadAds() {
    _nativeAd = NativeAd(
      adUnitId: 'ca-app-pub-3940256099942544/2247696110',
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          _addLoaded = true;
          debugPrint('Add is loaded: $_addLoaded');
          if (mounted) {
            setState(() {});
          }
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('Error is: $error');
          _addLoaded = false;
          if (mounted) {
            setState(() {});
          }
          debugPrint('Add is loaded: $_addLoaded');
          ad.dispose();
        },
      ),
      request: const AdRequest(),
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: TemplateType.medium,
        cornerRadius: 10.0,
      ),
    )..load();
  }

  @override
  void initState() {
    loadAds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (nativeAds == null) {
      return verticalSpaceTiny;
    } else {
      return Container(
        constraints: const BoxConstraints(
          minWidth: 320, // minimum recommended width
          minHeight: 90, // minimum recommended height
          maxWidth: 400,
          maxHeight: 200,
        ),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: AdWidget(ad: nativeAds!),
      );
    }
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: locator<HomeViewModel>().onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).cardColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(
          Icons.search,
        ),
        // suffixIcon: IconButton(
        //   icon: const Icon(
        //     Icons.filter_list_rounded,
        //   ),
        //   onPressed: () {
        //     showModalBottomSheet(
        //       context: context,
        //       isScrollControlled: true,
        //       useSafeArea: true,
        //       enableDrag: true,
        //       builder: (context) {
        //         return const FilterBottomSheet();
        //       },
        //     );
        //   },
        // ),
        hintText: 'Search jobs...',
      ),
    );
  }
}

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => locator<HomeViewModel>(),
        disposeViewModel: false,
        builder: (context, homeviewModel, child) {
          return Container(
            width: double.infinity,
            // height: MediaQuery.of(context).size.height * 0.85,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Row(),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 8,
                    width: 80,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: getThemeManager(context).isDarkMode
                          ? AppPallete.white
                          : AppPallete.jobTileColorDark,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Filter by',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                verticalSpaceSmall,
                const Text(
                  'Job type',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                _CheckBoxText(
                  text: 'Fixed Price',
                  value: homeviewModel.fixedPrice,
                  onChanged: homeviewModel.setFixedPrice,
                ),
                _CheckBoxText(
                  text: 'Hourly',
                  value: homeviewModel.hourly,
                  onChanged: homeviewModel.setHourly,
                ),
                verticalSpaceTiny,
                const Text(
                  'Experience level',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                _CheckBoxText(
                  text: 'Entry level',
                  value: homeviewModel.entryLevel,
                  onChanged: homeviewModel.setEntryLevel,
                ),
                _CheckBoxText(
                  text: 'Intermediate level',
                  value: homeviewModel.intermediateLevel,
                  onChanged: homeviewModel.setIntermediate,
                ),
                _CheckBoxText(
                  text: 'Expert Level',
                  value: homeviewModel.expertLevel,
                  onChanged: homeviewModel.setExpert,
                ),
                verticalSpaceTiny,
                const Text(
                  'Payment Status',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                _CheckBoxText(
                  text: 'Payment verified',
                  value: homeviewModel.isPaymentVerified,
                  onChanged: homeviewModel.setPaymentVerified,
                ),
                verticalSpaceLarge,
              ],
            ),
          );
        });
  }
}

class _CheckBoxText extends StatelessWidget {
  final String text;
  final bool value;
  final void Function(bool?)? onChanged;
  const _CheckBoxText({
    required this.text,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox.adaptive(
          value: value,
          onChanged: onChanged,
        ),
        horizontalSpaceSmall,
        Text(text),
      ],
    );
  }
}
