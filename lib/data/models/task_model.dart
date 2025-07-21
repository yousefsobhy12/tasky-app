class TaskModel {
  final String id;
  final String title;
  final String description;
  final int priority;
  final DateTime dateTime;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'priority': priority,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      priority: json['priority'] ?? 0,
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dateTime'] ?? 0),
    );
  }
  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    int? priority,
    DateTime? dateTime,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}
