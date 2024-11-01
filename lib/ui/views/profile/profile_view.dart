import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notifyme/app/app.locator.dart';
import 'package:notifyme/core/app_strings.dart';
import 'package:notifyme/core/enums/upwork_url.dart';
import 'package:notifyme/core/models/svgs.dart';
import 'package:notifyme/core/theme/app_decoration.dart';
import 'package:notifyme/core/theme/app_pallete.dart';
import 'package:notifyme/services/notification_service.dart';
import 'package:notifyme/ui/common/ui_helpers.dart';
import 'package:notifyme/ui/views/home/home_viewmodel.dart';
import 'package:notifyme/ui/views/profile/notification_settings.dart';
import 'package:notifyme/ui/views/shared/screens/webview_screen.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:url_launcher/url_launcher.dart';

import 'profile_viewmodel.dart';
import 'widgets/profile_tile.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            const SizedBox(height: 200),
            Container(
              width: double.infinity,
              height: 150,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Images.notifyMELogo),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 15,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppPallete.green.withOpacity(0.5),
                    width: 3,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 40,
                  child: Text(
                    'N',
                    style: TextStyle(fontSize: 32),
                  ),
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bronze Freelancer',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                verticalSpaceSmall,
                Text(
                  'App Settings',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppPallete.darktext,
                  ),
                ),
                verticalSpaceSmall,
                ViewModelBuilder<HomeViewModel>.reactive(
                  viewModelBuilder: () => locator<HomeViewModel>(),
                  disposeViewModel: false,
                  builder: (context, homeviewModel, child) {
                    return Stack(
                      children: [
                        DropdownMenu(
                          trailingIcon:
                              const Icon(Icons.keyboard_arrow_down_rounded),
                          expandedInsets:
                              const EdgeInsets.symmetric(vertical: 5),
                          inputDecorationTheme: InputDecorationTheme(
                            fillColor: Theme.of(context).cardColor,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: AppPallete.transparent,
                              ),
                            ),
                          ),
                          initialSelection: homeviewModel.selectedUrl,
                          onSelected: homeviewModel.changeSelectedUrl,
                          enableFilter: false,
                          enableSearch: false,
                          dropdownMenuEntries: UpworkUrl.values
                              .map((e) => DropdownMenuEntry(
                                  value: e.url, label: e.title))
                              .toList(),
                        ),
                        Positioned(
                          top: 1,
                          left: 10,
                          child: Text(
                            'Select Upwork feed URL',
                            style: TextStyle(
                              fontSize: 10,
                              color: AppPallete.darktext,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                verticalSpaceTiny,
                ProfileTile(
                  leading: Icons.open_in_browser,
                  text: 'Open Upwork browser',
                  action: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WebviewScreen(
                          webLink: AppStrings.upworkBestMatch,
                        ),
                      ),
                    );
                  },
                ),
                ProfileTile(
                  leading: Icons.notifications_active,
                  text: 'Notification Settings',
                  action: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationSettings(),
                      ),
                    );
                  },
                ),
                ProfileTile(
                  text: 'Dark mode',
                  widget: Switch.adaptive(
                    value: getThemeManager(context).isDarkMode,
                    // activeColor: AppPallete.grey,
                    // inactiveTrackColor: AppPallete.white,
                    onChanged: (val) {
                      getThemeManager(context).toggleDarkLightTheme();
                      viewModel.stateSetter();
                    },
                  ),
                ),
                verticalSpaceSmall,
                Text(
                  'Your Account',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppPallete.darktext,
                  ),
                ),
                verticalSpaceSmall,
                ProfileTile(
                  iconColor: AppPallete.gold,
                  leading: Icons.circle,
                  text: 'Go Pro',
                  action: () {
                    //  Go pro logic
                    // Fluttertoast.showToast(
                    //   msg: 'Coming soon...',
                    //   toastLength: Toast.LENGTH_SHORT,
                    //   gravity: ToastGravity.SNACKBAR,
                    //   timeInSecForIosWeb: 1,
                    //   backgroundColor: AppPallete.green,
                    //   textColor: AppPallete.white,
                    //   fontSize: 16.0,
                    // );
                    NotificationService.showNotification(
                      id: 1,
                      title: 'This is the title',
                      body: 'This is the notif body',
                    );
                    NotificationService.showNotification(
                      id: 2,
                      title: 'This is the title1',
                      body: 'This is the notif body',
                    );
                    NotificationService.showNotification(
                      id: 3,
                      title: 'This is the title1',
                      body: 'This is the notif body',
                    );
                  },
                ),
                ShowUpAnimation(
                  child: GestureDetector(
                    onTap: () {
                      String? encodeQueryParameters(
                          Map<String, String> params) {
                        return params.entries
                            .map((MapEntry<String, String> e) =>
                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                            .join('&');
                      }

                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'connectwithayeni@gmail.com',
                        query: encodeQueryParameters(<String, String>{
                          'subject': 'notifyME: contact us',
                        }),
                      );
                      launchUrl(emailLaunchUri);
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: AppDecoration.contactDecor,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 30),
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.mail,
                              color: AppPallete.gold,
                            ),
                            horizontalSpaceTiny,
                            const Text('Contact Us'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}
