enum OrderStatus { pending, confirmed, shipped, delivered }

extension OrderStatusExtension on OrderStatus {
  String get name => toString().split('.').last;

  double get progress {
    switch (this) {
      case OrderStatus.pending:
        return 0.25;
      case OrderStatus.confirmed:
        return 0.5;
      case OrderStatus.shipped:
        return 0.75;
      case OrderStatus.delivered:
        return 1.0;
    }
  }
}
