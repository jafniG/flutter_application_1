import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/utils.dart';

class PushNotificationService {
  Future<void> initializeNotifications() async {
    await AwesomeNotifications().initialize(null, [
      NotificationChannel(
        channelKey: 'alert',
        channelName: 'Alerts',
        channelDescription: 'Notification as alerts',
        playSound: true,
        onlyAlertOnce: true,
        groupAlertBehavior: GroupAlertBehavior.Children,
        importance: NotificationImportance.High,
        defaultPrivacy: NotificationPrivacy.Private,
        defaultColor: Colors.deepPurple,
        ledColor: Colors.deepPurple,
        
      ),
    ], debug: true);
  }

  Future<void> requestPermissions() async {
    final isGranted = await AwesomeNotifications().isNotificationAllowed();
    if (!isGranted) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }

  Future<void> showNotifications(String title, String body, String shopID) async {
    AwesomeNotifications().createNotification(
      
      content: NotificationContent(
        id: Utils.generateRandomNumer(),
        channelKey: 'alert',
        title: title,
        body: body,
        criticalAlert: true,
        wakeUpScreen: true,
        payload: {
          "on_click": "open_shop_details",
          "shopID": shopID,
        }
        
      ),
    );
  }
}
