import 'dart:math';

class TaskModel {
  final int id;
  final String title;
  final String? description;
  final String priority;
  final int categoryId;
  final DateTime? dueDate;
  final bool completed;
  final String imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.categoryId,
    required this.dueDate,
    required this.completed,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    id: json["id"],
    title: json["title"],
    description: json["description"] ?? '',
    priority: json["priority"] ?? '',
    categoryId: json["category_id"],
    dueDate: json["due_date"] != null ? DateTime.parse(json["due_date"]) : null,
    completed: json["completed"],
    //handling image urls that are invalid by just replacing it with a random placeholder similar to the one
    //given in API Docs
    imageUrl: _getValidImage(json["image_url"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}

_getValidImage(String imgUrl) {
  //note that its not generic as it only checks if the url contains "https://picsum.photo" which is the one
  //mentioned in a API Docs
  return !imgUrl.contains('https://picsum.photo')
      ? 'https://picsum.photos/400/300?random=${Random().nextInt(4000)}'
      : imgUrl;
}
