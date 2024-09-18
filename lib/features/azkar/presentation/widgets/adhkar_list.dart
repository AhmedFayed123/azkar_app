import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task3/features/azkar/data/models/models.dart';
import 'package:task3/features/azkar/presentation/widgets/adhkar_screen_details.dart';

import '../azkar_controller/azkar_controller.dart';

class AdhkarList extends StatelessWidget {
  const AdhkarList({super.key});

  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.put(DataController());
    return Obx(
      () {
        if (dataController.categories.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: dataController.categories.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final category = dataController.categories[index];
              return ListItem(
                name: category.name,
                fun: () {
                  dataController.setSelectedDescriptions(category.id);

                  if (dataController.selectedDescriptions.isNotEmpty) {
                    Get.to(() => AdhkarScreenDetails(
                          description:
                              dataController.selectedDescriptions.toList(),
                          title: category.name,
                        ));
                  } else {
                    Get.snackbar(
                      'Error',
                      'No descriptions found for this category.',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
              );
            },
          );
        }
      },
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.name, required this.fun});

  final String name;
  final Function() fun;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: fun,
        child: Container(
          width: 190,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.teal),
          child: Center(
            child: Text(
              name,
              style: const TextStyle(color: Colors.white, fontSize: 32),
            ),
          ),
        ),
      ),
    );
  }
}
