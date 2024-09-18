import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import '../../database/database_helper.dart';
import '../../models/dhikr.dart';

class DhikrController extends GetxController {
  var dhikrList = <Dhikr>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDhikrList();
  }

  // Fetch the list of Dhikr from the database
  Future<void> fetchDhikrList() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> dhikrData = await db.query(DatabaseHelper.table);
    dhikrList.value = dhikrData.map((e) => Dhikr.fromMap(e)).toList();
  }

  // Add a new Dhikr to the list and database
  Future<void> addDhikr(Dhikr dhikr) async {
    Database db = await DatabaseHelper.instance.database;
    await db.insert(DatabaseHelper.table, dhikr.toMap());
    fetchDhikrList();  // Refresh the list after adding
  }

  // Increment the current count of a specific Dhikr
  Future<void> incrementCounter(Dhikr dhikr) async {
    if (dhikr.currentCount < dhikr.targetCount) {
      dhikr.currentCount++;
      Database db = await DatabaseHelper.instance.database;
      await db.update(
        DatabaseHelper.table,
        dhikr.toMap(),
        where: '${DatabaseHelper.columnId} = ?',
        whereArgs: [dhikr.id],
      );
      fetchDhikrList();  // Refresh the list after updating
    }
  }

  // Reset the count of a specific Dhikr
  Future<void> resetDhikr(Dhikr dhikr) async {
    dhikr.currentCount = 0;
    Database db = await DatabaseHelper.instance.database;
    await db.update(
      DatabaseHelper.table,
      dhikr.toMap(),
      where: '${DatabaseHelper.columnId} = ?',
      whereArgs: [dhikr.id],
    );
    fetchDhikrList();  // Refresh the list after resetting
  }

  // Delete a Dhikr from the list and database
  Future<void> deleteDhikr(Dhikr dhikr) async {
    Database db = await DatabaseHelper.instance.database;
    await db.delete(
      DatabaseHelper.table,
      where: '${DatabaseHelper.columnId} = ?',
      whereArgs: [dhikr.id],
    );
    fetchDhikrList();  // Refresh the list after deleting
  }
}