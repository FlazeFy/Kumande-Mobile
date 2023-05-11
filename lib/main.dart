import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kumande/Components/Navbars/bottom.dart';
import 'package:kumande/Pages/Landings/LoginPage/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool shouldUseFirestoreEmulator = false;
final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (shouldUseFirestoreEmulator) {
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  }

  String token = await FirebaseMessaging.instance.getToken();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('launch_background');

  final InitializationSettings initializationSettings =
      const InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
  });

  Future<void> msgHandler(RemoteMessage message) async {
    String title = message.notification?.title ?? '';
    String body = message.notification?.body ?? '';
    String payload = message.data['data'];

    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
            'channel_id', 'channel_name', 'channel_description',
            priority: Priority.high,
            importance: Importance.high,
            ticker: 'ticker');

    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidNotificationDetails,
    );
    Future<void> fcmBgHandler(RemoteMessage message) async {
      await Firebase.initializeApp();
      msgHandler(message);
    }

    FirebaseMessaging.onBackgroundMessage(fcmBgHandler);

    await flutterLocalNotificationsPlugin
        .show(0, title, body, platformChannelSpecifics, payload: payload);
  }

  FirebaseMessaging.onMessage.listen(msgHandler);

  final prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey("token_key")) {
    runApp(MyApp(signed: true));
  } else {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token_fcm_key', token);
    runApp(MyApp(signed: false));
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key key, this.signed}) : super(key: key);
  bool signed;

  @override
  Widget build(BuildContext context) {
    //Lock device on portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    if (signed) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kumande Mobile',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const BottomBar(),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kumande Mobile',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
      );
    }
  }
}
