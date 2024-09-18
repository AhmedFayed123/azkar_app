import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../data/models/models.dart';

class DataController extends GetxController {
  var categories = <CategoryModel>[].obs;
  var descriptions = <DescriptionModel>[].obs;
  var selectedDescriptions = <DescriptionModel>[].obs;

  @override
  void onInit() {
    loadCategories();
    loadDescriptions();
    super.onInit();
  }

  void loadCategories() async {
    try {
      final data =
          await rootBundle.loadString("assets/database/sections_db.json");
      final List<dynamic> response = json.decode(data);

      categories.value =
          response.map((category) => CategoryModel.fromJson(category)).toList();
    } catch (error) {
      print(error);
    }
  }

  void loadDescriptions() async {
    try {
      final data = await rootBundle
          .loadString("assets/database/section_details_db.json");
      final List<dynamic> response = json.decode(data);

      descriptions.value = response
          .map((section) => DescriptionModel.fromJson(section))
          .toList();
    } catch (error) {
      print(error);
    }
  }

  void setSelectedDescriptions(int categoryId) {
    selectedDescriptions.value =
        descriptions.where((desc) => desc.sectionId == categoryId).toList();
  }
}
