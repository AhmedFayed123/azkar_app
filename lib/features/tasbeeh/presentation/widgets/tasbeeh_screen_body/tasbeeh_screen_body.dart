import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/dhikr.dart';
import '../../controller/tasbeeh_controller.dart';

class TasbeehScreenBody extends StatelessWidget {
  final DhikrController dhikrController = Get.put(DhikrController());

  TasbeehScreenBody({super.key});

  final List<String> predefinedDhikrList = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله',
    'استغفر الله'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal[50],
        child: Obx(() {
          if (dhikrController.dhikrList.isEmpty) {
            return Center(
              child: Text(
                'لا توجد أذكار مسجلة',
                style: TextStyle(fontSize: 18, color: Colors.teal[900]),
              ),
            );
          }
          return ListView.builder(
            itemCount: dhikrController.dhikrList.length,
            itemBuilder: (context, index) {
              Dhikr dhikr = dhikrController.dhikrList[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  title: Text(
                    dhikr.name,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'العدد الحالي: ${dhikr.currentCount}/${dhikr.targetCount}',
                    style: TextStyle(color: Colors.teal[800]),
                  ),
                  trailing: Wrap(
                    spacing: 8,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add_circle, color: Colors.teal),
                        onPressed: () => dhikrController.incrementCounter(dhikr),
                      ),
                      IconButton(
                        icon: const Icon(Icons.refresh, color: Colors.orangeAccent),
                        onPressed: () => dhikrController.resetDhikr(dhikr),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.redAccent),
                        onPressed: () => _confirmDelete(context, dhikr),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDhikrDialog(context),
        tooltip: 'إضافة ذكر',
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showAddDhikrDialog(BuildContext context) {
    String selectedDhikr = predefinedDhikrList[0]; // اختيار أول ذكر كافتراضي
    int targetCount = 0;

    Get.defaultDialog(
      title: 'إضافة ذكر جديد',
      content: Column(
        children: [
          DropdownButton<String>(
            value: selectedDhikr,
            items: predefinedDhikrList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              selectedDhikr = newValue!;
            },
          ),
          const SizedBox(height: 10),
          TextField(
            onChanged: (value) {
              targetCount = int.tryParse(value) ?? 0;
            },
            decoration: const InputDecoration(
              labelText: 'العدد المستهدف',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      textConfirm: 'إضافة',
      textCancel: 'إلغاء',
      confirmTextColor: Colors.white,
      onConfirm: () {
        if (selectedDhikr.isNotEmpty && targetCount > 0) {
          Dhikr newDhikr = Dhikr(name: selectedDhikr, targetCount: targetCount);
          dhikrController.addDhikr(newDhikr);
          Get.back();
        }
      },
      buttonColor: Colors.teal,
    );
  }
  void _confirmDelete(BuildContext context, Dhikr dhikr) {
    Get.defaultDialog(
      title: 'حذف الذكر',
      middleText: 'هل أنت متأكد أنك تريد حذف هذا الذكر؟',
      textConfirm: 'نعم',
      textCancel: 'لا',
      confirmTextColor: Colors.white,
      onConfirm: () {
        dhikrController.deleteDhikr(dhikr);
        Get.back();
      },
      buttonColor: Colors.redAccent,
    );
  }
}