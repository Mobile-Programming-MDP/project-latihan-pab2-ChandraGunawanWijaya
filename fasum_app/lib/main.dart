import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> requestNotificationPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print("Izin Notifikasi diberikan");
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print("Izin notifikasi sementara diberikan ");
  } else {
    print("Izin notifikasi diberikan");
  }

  Future<void> showBasicNotification(String? title, String? body) async {
    final android = AndroidNotificationDetails(
      'defaut_channel',
      'Notifikasi Default',
      channelDescription: 'Notifikasi masuk dari FCM',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
    );
    final platform = NotificationDetails(android: android);
    await flutterLocalNotificationsPlugin.show(0, title, body, platform);
  }

  Future<void> showNotificationFromData(Map<String, dynamic> data) async {
    final title = data['title'] ?? 'Pesan Baru';
    final body = data['body'] ?? '';
    final sender = data['senderName'] ?? 'Pengertian tidak diketahui';
    final time = data['sentAt'] ?? '';

    ByteArrayAndroidBitmap? largeIconBitmap;
    if (photoUrl.isNotEmpty) {
      final base64 = await _networkImageToBase64(photoUrl);
      if (base64 != null) {
        largeIconBitmap = ByteArrayAndroidBitmap.fromBase64String(base64);
      }
    }
  }
}
