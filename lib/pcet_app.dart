import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pcet_placements/presentation/auth/widgets/authentication_page.dart';
import 'package:pcet_placements/presentation/splash.dart';
import 'package:pcet_placements/presentation/theme/app_colors.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class PCETApp extends StatefulWidget {
  const PCETApp({Key? key}) : super(key: key);

  @override
  State<PCETApp> createState() => _PCETAppState();
}

class _PCETAppState extends State<PCETApp> {
  @override
  void initState() {
    super.initState();
    requestPermission();
    initInfo();
  }

  @override
  Widget build(BuildContext context) {
    // Premade canvas for android apps
    return MaterialApp(
      // Defines App Theme
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.mercury,
        primaryColor: AppColors.casablanca,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: AppColors.mercury,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: SafeArea(
        child: SplashScreen(),
      ),
    );
  }

  void initInfo() async {
    var androidInitialize = const AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    var initializationSettings = InitializationSettings(
      android: androidInitialize,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        switch (notificationResponse.notificationResponseType) {
          case NotificationResponseType.selectedNotification:
            debugPrint('NOTIFICATION SELECTED');
            // selectNotificationStream.add(notificationResponse.payload);
            break;
          case NotificationResponseType.selectedNotificationAction:
            if (notificationResponse.actionId == 'id_3') {
              // selectNotificationStream.add(notificationResponse.payload);
              debugPrint(
                  'NOTIFICATION ACTION ID: ${notificationResponse.actionId}');
            }
            break;
        }
      },
      // onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
    // Listens to notifications from firebase.
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      debugPrint('...........................onMessage.....................');
      debugPrint(
          'onMessage: ${message.notification?.title}/${message.notification?.body}');
      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(),
        htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(),
        htmlFormatContent: true,
      );
      AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
        'PCET PLACEMENTS',
        'PCET PLACEMENTS',
        icon: '@mipmap/ic_launcher',
        importance: Importance.high,
        styleInformation: bigTextStyleInformation,
        priority: Priority.max,
        playSound: true,
      );

      NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidNotificationDetails,
      );
      // Shows notification
      await flutterLocalNotificationsPlugin.show(
        78,
        message.notification?.title,
        message.notification?.body,
        platformChannelSpecifics,
        payload: message.data['title'],
      );
    });
  }

  // Asks for permission on whether to send a notification or not.
  // By Default, permission is granted but for some devices it is necessary to
  // take permissions.
  // @pragma('vm:entry-point')
  void requestPermission() async {
    // Object for firebase messaging, as it is a singleton class.
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    debugPrint('FCM TOKEN : ${await messaging.getToken()}');
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('NOTIFICATION PERMISSION GRANTED');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint('PROVISIONAL PERMISSION FOR NOTIFICATIONS');
    } else {
      debugPrint('DELINED NOTIFICATION PERMISSION');
    }
  }
}
