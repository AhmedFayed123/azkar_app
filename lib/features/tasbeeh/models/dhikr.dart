class Dhikr {
  int? id;
  final String name;
  final int targetCount;
  int currentCount;

  Dhikr({
    this.id,
    required this.name,
    required this.targetCount,
    this.currentCount = 0,
  });

  factory Dhikr.fromMap(Map<String, dynamic> json) => Dhikr(
    id: json['_id'],
    name: json['name'],
    targetCount: json['targetCount'],
    currentCount: json['currentCount'],
  );

  Map<String, dynamic> toMap() => {
    '_id': id,
    'name': name,
    'targetCount': targetCount,
    'currentCount': currentCount,
  };
}