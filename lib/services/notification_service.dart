import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:notifyme/ui/views/shared/screens/webview_screen.dart';
import 'package:stacked_services/stacked_services.dart';

class NotificationService {
  NotificationService._();

  @pragma('vm:entry-point')
  static void onStart(ServiceInstance service) async {
    // Only available for flutter 3.0.0 and later
    DartPluginRegistrant.ensureInitialized();

    if (service is AndroidServiceInstance) {
      service.on('setAsForeground').listen((event) {
        service.setAsForegroundService();
      });

      service.on('setAsBackground').listen((event) {
        service.setAsBackgroundService();
      });
    }

    service.on('stopService').listen((event) {
      service.stopSelf();
    });
  }

  static final service = FlutterBackgroundService();
  static final _notifPlugin = FlutterLocalNotificationsPlugin();
  static Future<void> initNotification() async {
    const initAndroidNotif = AndroidInitializationSettings('logo');
    const initIosNotif = DarwinInitializationSettings();
    const initializationSettings =
        InitializationSettings(android: initAndroidNotif, iOS: initIosNotif);
    await _notifPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onReceiveNotif,
      onDidReceiveBackgroundNotificationResponse: onReceiveNotif,
    );
    await service.configure(
      iosConfiguration: IosConfiguration(),
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        foregroundServiceTypes: [
          AndroidForegroundType.dataSync,
          AndroidForegroundType.specialUse,
        ],
        autoStart: false,
        isForegroundMode: true,
        notificationChannelId: 'notifyME-ForegroundService',
        initialNotificationTitle: 'NotifyME Job Service',
        initialNotificationContent: 'Running Upwork job service...',
        foregroundServiceNotificationId: 888,
      ),
    );
  }

  static void onReceiveNotif(NotificationResponse details) async {
    final payload = details.payload;
    await _navtoJobWebpage(payload);
  }

  static Future<void> _navtoJobWebpage(String? payload) async {
    if (payload != null) {
      final load = jsonDecode(payload);
      if (load is Map && load.containsKey('job')) {
        await StackedService.navigatorKey?.currentState?.push(MaterialPageRoute(
          builder: (context) => WebviewScreen(
            webLink: 'https://www.upwork.com${load['job']}',
          ),
        ));
      }
    }
  }

  static Future showNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async {
    final jsonLoad = jsonEncode({'job': payload});
    return _notifPlugin.show(
      id,
      title,
      body,
      payload: jsonLoad,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'notifyME',
          'job_notification',
          showWhen: true,
          groupAlertBehavior: GroupAlertBehavior.all,
          groupKey: 'Job_notif_group',
          actions: [
            // AndroidNotificationAction(
            //   'id_1',
            //   'Open job',
            // ),
            AndroidNotificationAction(
              'id_2',
              'Close',
            ),
          ],
        ),
        iOS: DarwinNotificationDetails(),
      ),
    );
  }

  static Future showSummaryNotification({
    required int jobLength,
  }) async {
    return _notifPlugin.show(
      -10,
      'You have $jobLength new jobs on upwork!',
      null,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'notifyME',
          'job_notification',
          showWhen: true,
          setAsGroupSummary: true,
          groupAlertBehavior: GroupAlertBehavior.all,
          groupKey: 'Job_notif_group',
        ),
        iOS: DarwinNotificationDetails(),
      ),
    );
  }

  // static Future showForegroundNotification(
  //     //   {
  //     //   required int id,
  //     //   required String title,
  //     //   required String body,
  //     //   // required String payload,
  //     // }
  //     ) async {
  //   return _notifPlugin.show(
  //     888,
  //     'NotifyME Job Service',
  //     'Running Upwork job service...',
  //     const NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         'notifyME-ForegroundService',
  //         'job_notification_foregroundService',
  //         ongoing: true,
  //       ),
  //       iOS: DarwinNotificationDetails(),
  //     ),
  //   );
  // }
}
