class TaskCategory {
  int id;
  String name;
  String color;
  String iconUrl;
  String imageFilter;
  int imageSeedOffset;
  DateTime createdAt;

  TaskCategory({
    required this.id,
    required this.name,
    required this.color,
    required this.iconUrl,
    required this.imageFilter,
    required this.imageSeedOffset,
    required this.createdAt,
  });

  factory TaskCategory.fromJson(Map<String, dynamic> json) => TaskCategory(
    id: json["id"],
    name: json["name"],
    color: json["color"],
    iconUrl: json["icon_url"],
    imageFilter: json["image_filter"],
    imageSeedOffset: json["image_seed_offset"],
    createdAt: DateTime.parse(json["created_at"]),
  );
}
