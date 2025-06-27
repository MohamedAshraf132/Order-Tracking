import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

import 'services/fcm_service.dart';
import 'services/huawei_push_service.dart'; // ✅ استيراد Huawei Push
import 'viewmodels/order_view_model.dart';
import 'views/order_tracking_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(); // ✅ تهيئة Firebase
  await FCMService().initFCM(); // ✅ تهيئة إشعارات FCM
  await HuaweiPushService.initHuaweiPush(); // ✅ تهيئة إشعارات هواوي

  runApp(
    ChangeNotifierProvider(
      create: (_) => OrderViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        title: 'Order Tracker',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: OrderTrackingScreen(),
      ),
    );
  }
}
