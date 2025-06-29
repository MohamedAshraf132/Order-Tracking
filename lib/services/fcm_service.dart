import 'package:firebase_messaging/firebase_messaging.dart';
import 'notification_service.dart';

class FCMService {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initFCM() async {
    await _firebaseMessaging.requestPermission();

    String? token = await _firebaseMessaging.getToken();
    print('FCM Token: $token');

    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification != null) {
        NotificationService.showOverlayNotification(
          notification.title ?? 'No Title',
          notification.body ?? 'No Body',
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Notification clicked: ${message.data}');
    });
  }
}
