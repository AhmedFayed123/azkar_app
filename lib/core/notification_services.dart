import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  void initialize() {
    // Request notification permission if not already granted
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    AwesomeNotifications().initialize(
      'resource://drawable/beer', // Set your app icon here
      [
        NotificationChannel(
          channelKey: 'morning_channel',
          channelName: 'أذكار الصباح',
          channelDescription: 'الإشعارات الخاصة بأذكار الصباح',
          defaultColor: const Color(0xFF9D50DD),
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          defaultRingtoneType: DefaultRingtoneType.Notification,
          playSound: true,
        ),
        NotificationChannel(
          channelKey: 'evening_channel',
          channelName: 'أذكار المساء',
          channelDescription: 'الإشعارات الخاصة بأذكار المساء',
          defaultColor: const Color(0xFF9D50DD),
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          defaultRingtoneType: DefaultRingtoneType.Notification,
          playSound: true,
        ),
        NotificationChannel(
          channelKey: 'hourly_channel',
          channelName: 'تذكير كل ساعة',
          channelDescription: 'الإشعارات الخاصة بتذكير الذكر كل ساعة',
          defaultColor: const Color(0xFF9D50DD),
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          defaultRingtoneType: DefaultRingtoneType.Notification,
          playSound: true,
        ),
      ],
      debug: true,
    );
  }

  Future<void> scheduleNotifications(
      TimeOfDay morningTime, TimeOfDay eveningTime) async {
    await AwesomeNotifications().cancelAll();

    // Schedule morning Azkar
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 0,
        channelKey: 'morning_channel',
        title: 'أذكار الصباح',
        body: 'حان الآن وقت أذكار الصباح',
      ),
      schedule: NotificationCalendar(
        hour: morningTime.hour,
        minute: morningTime.minute,
        second: 0,
        millisecond: 0,
        repeats: true,
        timeZone: tz.local.name,
      ),
    );

    // Schedule evening Azkar
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'evening_channel',
        title: 'أذكار المساء',
        body: 'حان الآن وقت أذكار المساء',
      ),
      schedule: NotificationCalendar(
        hour: eveningTime.hour,
        minute: eveningTime.minute,
        second: 0,
        millisecond: 0,
        repeats: true,
        timeZone: tz.local.name,
      ),
    );

    // Schedule hourly reminder
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 2,
        channelKey: 'hourly_channel',
        title: 'تذكير الساعة',
        body: 'تذكير بالذكر كل ساعة',
      ),
      schedule: NotificationInterval(
        interval: 60 * 60, // كل ساعة
        timeZone: tz.local.name,
        repeats: true,
      ),
    );
  }
}
