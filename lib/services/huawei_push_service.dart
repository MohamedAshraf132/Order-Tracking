import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:huawei_push/huawei_push.dart';

class HuaweiPushService {
  static Future<void> initHuaweiPush() async {
    try {
      // طلب التوكن
      Push.getToken("");

      // الاستماع للتوكن
      Push.getTokenStream.listen((String? token) {
        print('📱 Huawei Push Token: $token');
      });

      // الاستماع للإشعارات
      Push.onMessageReceivedStream.listen((RemoteMessage message) {
        final notification = message.notification;
        if (notification != null) {
          showSimpleNotification(
            Text(notification.title ?? 'Huawei Notification'),
            subtitle: Text(notification.body ?? 'No body'),
            background: Colors.green,
            duration: const Duration(seconds: 4),
          );
        }
      });
    } catch (e) {
      print('❌ Huawei Push Init Error: $e');
    }
  }
}
