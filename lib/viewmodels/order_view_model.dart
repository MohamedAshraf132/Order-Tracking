import 'package:flutter/material.dart';
import '../models/order_status.dart';
import '../services/notification_service.dart';

class OrderViewModel extends ChangeNotifier {
  OrderStatus _currentStatus = OrderStatus.pending;
  OrderStatus get currentStatus => _currentStatus;

  void updateStatus(OrderStatus newStatus) {
    final oldStatus = _currentStatus;
    _currentStatus = newStatus;
    notifyListeners();

    NotificationService.showOverlayNotification(
      'Order Status Update',
      'Your order changed from ${oldStatus.name} to ${newStatus.name}',
    );
  }
}
