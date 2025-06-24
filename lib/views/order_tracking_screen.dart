import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/order_status.dart';
import '../viewmodels/order_view_model.dart';

class OrderTrackingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OrderViewModel>(context);
    final status = viewModel.currentStatus;

    return Scaffold(
      appBar: AppBar(title: const Text('Order Tracking')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Current Status: ${status.name.toUpperCase()}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            LinearProgressIndicator(
              value: status.progress,
              minHeight: 10,
              color: Colors.blue,
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(height: 30),
            _buildButton(context, status, OrderStatus.confirmed, 'Confirm'),
            _buildButton(context, status, OrderStatus.shipped, 'Ship'),
            _buildButton(context, status, OrderStatus.delivered, 'Deliver'),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    OrderStatus current,
    OrderStatus target,
    String label,
  ) {
    final isEnabled = target.index == current.index + 1;

    return ElevatedButton(
      onPressed: isEnabled
          ? () => Provider.of<OrderViewModel>(
              context,
              listen: false,
            ).updateStatus(target)
          : null,
      child: Text(label),
    );
  }
}
