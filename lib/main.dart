import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pcet_placements/firebase_options.dart';
import 'package:pcet_placements/pcet_app.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Ensures that app is initialized on firebase's end
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Gets pending notifications from firebase
  await FirebaseMessaging.instance.getInitialMessage();
  // Handles terminated and background state notifications.
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  // App starts from here
  runApp(
    const PCETApp(),
  );
}
