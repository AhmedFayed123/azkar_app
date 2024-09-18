import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/notification_controller.dart';

class SettingsBody extends StatelessWidget {
  SettingsBody({super.key});

  final AzkarController controller = Get.put(AzkarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ضبط الاشعارات')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text(
              'الوقت المختار لأذكار الصباح: ${controller.selectedMorningTime.value.format(context)}',
              style: const TextStyle(fontSize: 18),
            )),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                TimeOfDay? newTime = await showTimePicker(
                  context: context,
                  initialTime: controller.selectedMorningTime.value,
                );
                if (newTime != null) {
                  controller.updateMorningTime(newTime);
                }
              },
              child: const Text('اختر وقت أذكار الصباح'),
            ),
            const SizedBox(height: 20),
            Obx(() => Text(
              'الوقت المختار لأذكار المساء: ${controller.selectedEveningTime.value.format(context)}',
              style: const TextStyle(fontSize: 18),
            )),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                TimeOfDay? newTime = await showTimePicker(
                  context: context,
                  initialTime: controller.selectedEveningTime.value,
                );
                if (newTime != null) {
                  controller.updateEveningTime(newTime);
                }
              },
              child: const Text('اختر وقت أذكار المساء'),
            ),
            const SizedBox(height: 20),
            const Text(
              'تذكير كل ساعة',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                controller.scheduleNotifications();
              },
              child: const Text('احفظ التغييرات وجدول الإشعارات'),
            ),
          ],
        ),
      ),
    );
  }
}
