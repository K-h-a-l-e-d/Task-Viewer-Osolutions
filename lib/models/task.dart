class Task {
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

  Task({
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

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"],
    title: json["title"],
    description: json["description"] ?? '',
    priority: json["priority"] ?? '',
    categoryId: json["category_id"],
    dueDate: json["due_date"] != null ? DateTime.parse(json["due_date"]) : null,
    completed: json["completed"],
    imageUrl: json["image_url"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}
