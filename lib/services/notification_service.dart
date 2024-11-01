import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  NotificationService._();
  static final _notifPlugin = FlutterLocalNotificationsPlugin();
  static Future<void> initNotification() async {
    const initAndroidNotif = AndroidInitializationSettings('logo');
    const initIosNotif = DarwinInitializationSettings();
    const initializationSettings =
        InitializationSettings(android: initAndroidNotif, iOS: initIosNotif);
    await _notifPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
    );
  }

  static Future showNotification({
    required int id,
    required String title,
    required String body,
    // required String payload,
  }) async {
    return _notifPlugin.show(
      id,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'notifyME',
          'job_notification',
        ),
        iOS: DarwinNotificationDetails(),
      ),
    );
  }
}
