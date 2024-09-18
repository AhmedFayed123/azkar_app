class DescriptionModel {
  final int sectionId;
  final String count;
  final String description;
  final String reference;
  final String content;

  DescriptionModel({
    required this.sectionId,
    required this.count,
    required this.description,
    required this.reference,
    required this.content,
  });

  factory DescriptionModel.fromJson(Map<String, dynamic> json) {
    return DescriptionModel(
      sectionId: json['section_id'],
      count: json['count'],
      description: json['description'],
      reference: json['reference'],
      content: json['content'],
    );
  }
}

class CategoryModel {
  final int id;
  final String name;

  CategoryModel({
    required this.id,
    required this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
