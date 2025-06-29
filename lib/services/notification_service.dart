import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class NotificationService {
  static void showOverlayNotification(String title, String body) {
    showSimpleNotification(
      Row(
        children: [
          const Icon(Icons.notifications_active, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      subtitle: Text(body, style: const TextStyle(color: Colors.white70)),
      background: Colors.teal,
      elevation: 6,
      autoDismiss: true,
      slideDismiss: true,
      duration: const Duration(seconds: 4),
    );
  }
}
