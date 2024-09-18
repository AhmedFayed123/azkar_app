import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  Future<SharedPreferences> _getPreferences() async {
    return await SharedPreferences.getInstance();
  }

  Future<bool> getNotificationEnabled() async {
    final prefs = await _getPreferences();
    return prefs.getBool('notifications_enabled') ?? false;
  }

  Future<void> setNotificationEnabled(bool isEnabled) async {
    final prefs = await _getPreferences();
    await prefs.setBool('notifications_enabled', isEnabled);
  }

  Future<TimeOfDay> getMorningTime() async {
    final prefs = await _getPreferences();
    final hour = prefs.getInt('morning_hour') ?? 5;
    final minute = prefs.getInt('morning_minute') ?? 0;
    return TimeOfDay(hour: hour, minute: minute);
  }

  Future<void> setMorningTime(TimeOfDay time) async {
    final prefs = await _getPreferences();
    await prefs.setInt('morning_hour', time.hour);
    await prefs.setInt('morning_minute', time.minute);
  }

  Future<TimeOfDay> getEveningTime() async {
    final prefs = await _getPreferences();
    final hour = prefs.getInt('evening_hour') ?? 20;
    final minute = prefs.getInt('evening_minute') ?? 0;
    return TimeOfDay(hour: hour, minute: minute);
  }

  Future<void> setEveningTime(TimeOfDay time) async {
    final prefs = await _getPreferences();
    await prefs.setInt('evening_hour', time.hour);
    await prefs.setInt('evening_minute', time.minute);
  }
}