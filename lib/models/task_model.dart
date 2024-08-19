// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String subtitle;
  @HiveField(3)
  DateTime createdTime;
  @HiveField(4)
  DateTime createdDate;
  @HiveField(5)
  bool isCompleted;

  TaskModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.createdTime,
    required this.createdDate,
    required this.isCompleted,
  });

  factory TaskModel.create({
    required String? title,
    required String? subtitle,
    DateTime? createdTime,
    DateTime? createdDate,
  }) =>
      TaskModel(
        id: const Uuid().v1(),
        title: title ?? "",
        subtitle: subtitle ?? "",
        createdTime: createdTime ?? DateTime.now(),
        createdDate: createdDate ?? DateTime.now(),
        isCompleted: false,
      );
}
