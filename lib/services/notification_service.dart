import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class NotificationService {
  static void showOverlayNotification(String title, String body) {
    showSimpleNotification(
      Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(body),
      background: Colors.blue,
      duration: const Duration(seconds: 4),
    );
  }
}
