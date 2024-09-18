import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import '../../../../core/notification_services.dart';

class AzkarController extends GetxController {
  var selectedMorningTime = const TimeOfDay(hour: 6, minute: 0).obs;
  var selectedEveningTime = const TimeOfDay(hour: 18, minute: 0).obs;

  final NotificationService notificationService = NotificationService();

  @override
  void onInit() {
    super.onInit();
    tz.initializeTimeZones();  // Initialize timezones
    tz.setLocalLocation(tz.getLocation('Africa/Cairo')); // Adjust according to location
    notificationService.initialize();
    loadPreferences();
  }

  Future<void> scheduleNotifications() async {
    await notificationService.scheduleNotifications(
      selectedMorningTime.value,
      selectedEveningTime.value,
    );
  }

  Future<void> savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('morning_hour', selectedMorningTime.value.hour);
    prefs.setInt('morning_minute', selectedMorningTime.value.minute);
    prefs.setInt('evening_hour', selectedEveningTime.value.hour);
    prefs.setInt('evening_minute', selectedEveningTime.value.minute);
  }

  Future<void> loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedMorningTime.value = TimeOfDay(
      hour: prefs.getInt('morning_hour') ?? 6,
      minute: prefs.getInt('morning_minute') ?? 0,
    );
    selectedEveningTime.value = TimeOfDay(
      hour: prefs.getInt('evening_hour') ?? 18,
      minute: prefs.getInt('evening_minute') ?? 0,
    );
  }

  void updateMorningTime(TimeOfDay newTime) {
    selectedMorningTime.value = newTime;
    savePreferences();
  }

  void updateEveningTime(TimeOfDay newTime) {
    selectedEveningTime.value = newTime;
    savePreferences();
  }
}
