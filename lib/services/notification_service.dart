import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final _notifPlugin = FlutterLocalNotificationsPlugin();
  Future<void> initNotification() async {
    const initAndroidNotif = AndroidInitializationSettings('ic_launcher.png');
    const initIosNotif = DarwinInitializationSettings();
    const initializationSettings =
        InitializationSettings(android: initAndroidNotif, iOS: initIosNotif);
    await _notifPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
    );
  }

  Future showNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
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
