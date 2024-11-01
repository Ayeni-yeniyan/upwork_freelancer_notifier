import 'package:flutter/material.dart';
import 'package:notifyme/app/app.locator.dart';
import 'package:notifyme/core/theme/app_pallete.dart';
import 'package:notifyme/services/audio_service.dart';
import 'package:notifyme/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

import 'widgets/profile_tile.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notification Settings',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppPallete.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ViewModelBuilder<HomeViewModel>.reactive(
              viewModelBuilder: () => locator<HomeViewModel>(),
              disposeViewModel: false,
              builder: (context, homeviewModel, child) {
                return Column(
                  children: [
                    ProfileTile(
                      text: 'Enable Notification',
                      widget: Switch.adaptive(
                        value: homeviewModel.enableNofif,
                        onChanged: homeviewModel.setNotifStat,
                      ),
                    ),
                    ProfileTile(
                      text: 'Enable Sound',
                      widget: Switch.adaptive(
                        value: homeviewModel.enableSound,
                        onChanged: homeviewModel.setSoundStat,
                      ),
                    ),
                  ],
                );
              },
            ),
            ProfileTile(
              text: AudioService.selectedSoundName != null
                  ? 'Current sound: ${AudioService.selectedSoundName}'
                  : 'Select a Sound',
              leading: Icons.music_note,
              action: () async {
                await AudioService.selectSound();
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
