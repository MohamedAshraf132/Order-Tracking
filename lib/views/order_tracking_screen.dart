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
      extendBodyBehindAppBar: true,

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe0f7fa), Color(0xFFffffff)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              shadowColor: Colors.blueAccent.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.local_shipping_outlined,
                      color: Colors.teal,
                      size: 30,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Current Status:\n${status.name.toUpperCase()}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text('Progress', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: status.progress,
                minHeight: 12,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Update Status:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 12,
              children: [
                _buildButton(context, status, OrderStatus.confirmed, 'Confirm'),
                _buildButton(context, status, OrderStatus.shipped, 'Ship'),
                _buildButton(context, status, OrderStatus.delivered, 'Deliver'),
              ],
            ),
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
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        backgroundColor: isEnabled ? Colors.teal : Colors.grey[400],
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: isEnabled ? 4 : 0,
        shadowColor: Colors.tealAccent,
      ),
    );
  }
}
