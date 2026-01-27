import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Service/notification/push_Notification_Service.dart';
import 'package:flutter_application_1/controller/authentication_provider.dart';
import 'package:flutter_application_1/controller/products/product_provider.dart';
import 'package:flutter_application_1/controller/shop_provider.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/view/shop_details_page.dart';
import 'package:flutter_application_1/view/splash_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
final pushNotification = PushNotificationService();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await _firebaseMessaging.requestPermission();
  await pushNotification.initializeNotifications();

  String? token = await _firebaseMessaging.getToken(
    vapidKey:
        "BAIinJ32RhpzCXoICo-C9a3zcSYqvaVmBHdEMjMG2TNfCRdZoAYkhzZ9TGpZ0SsEvMyeBg1UCqgeqdhwITZ6mBQ",
  );
  log('Registration Token=$token');

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    final title = message.notification?.title;
    final body = message.notification?.body;
    final shopID = message.data['shopID'];
    if (title != null && body != null) {
      pushNotification.showNotifications(title, body, shopID);
      log(
        'Message also contained a notification: ${message.notification?.body}',
      );
    }
  });

  // Get initial message if app was launched from notification
  RemoteMessage? initialMessage = await _firebaseMessaging.getInitialMessage();
  if (initialMessage != null) {
    _backgroundHandler(initialMessage);
  }
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    log('Message Clicked! ${message.messageId}');
  });
  AwesomeNotifications().setListeners(
    onActionReceivedMethod: onActionReceivedMethod,
    // ... other listeners like onNotificationCreatedMethod, etc.
  );

  // Handle background/terminated state messages
  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);

  runApp(MyApp());
}

@pragma("vm:entry-point")
Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
  // Access the payload data using receivedAction.payload
  final Map<String, String?>? payload = receivedAction.payload;

  if (payload != null) {
    String? value = payload['on_click'];
    String? shopID = payload['shopID'];
    if (value == "open_shop_details") {
      if (shopID == null) return;
      navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (_) => ShopDetailsPage(shopID: shopID)),
      );
    }
  }
}

Future<void> _backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  log("Handling a background message: ${message.messageId}");
  final title = message.notification?.title;
  final body = message.notification?.body;
  final shopID = message.data["shopID"];
  if (title != null && body != null) {
    pushNotification.showNotifications(title, body, shopID);
    log('Message also contained a notification: ${message.notification?.body}');
  }
}

// Other methods like _firebaseBackgroundMessageHandler, _handleMessage, getFCMToken, etc.

//   await pushNotification.initializeNotifications();
//   // await pushNotification.requestPermissions();

//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     final title = message.notification?.title;
//     final body = message.notification?.body;
//     final shopID = message.data['shopID'];
//     if (title != null && body != null) {
//       pushNotification.showNotifications(title, body, shopID);
//       log(
//         'Message also contained a notification: ${message.notification?.body}',
//       );
//     }
//   });

//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     log('Message Clicked! ${message.messageId}');
//   });
//   AwesomeNotifications().setListeners(
//     onActionReceivedMethod: onActionReceivedMethod,
//     // ... other listeners like onNotificationCreatedMethod, etc.
//   );
//   String? token = await _firebaseMessaging.getToken();
//   log('Registration Token=$token');

//   FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
//   runApp(MyApp());
// }

// @pragma("vm:entry-point")
// Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
//   // Access the payload data using receivedAction.payload
//   final Map<String, String?>? payload = receivedAction.payload;

//   if (payload != null) {
//     String? value = payload['on_click'];
//     String? shopID = payload['shopID'];
//     if (value == "open_shop_details") {
//       if (shopID == null) return;
//       navigatorKey.currentState?.push(
//         MaterialPageRoute(builder: (_) => ShopDetailsPage(shopID: shopID)),
//       );
//     }
//   }
// }

// Future<void> _backgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();

//   log("Handling a background message: ${message.messageId}");
//   final title = message.notification?.title;
//   final body = message.notification?.body;
//   final shopID = message.data["shopID"];
//   if (title != null && body != null) {
//     pushNotification.showNotifications(title, body, shopID);
//     log('Message also contained a notification: ${message.notification?.body}');
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShopProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
      ],

      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: SplashScreen(),
      ),
    );
  }
}
