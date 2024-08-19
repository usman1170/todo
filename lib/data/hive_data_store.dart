import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/models/task_model.dart';

class HiveDataStore {
  static const boxName = "taskBox";
  final Box<TaskModel> box = Hive.box<TaskModel>(boxName);
  Future<void> addTask({required TaskModel task}) async {
    await box.put(task.id, task);
  }

  Future<TaskModel?> getTask({required String id}) async {
    return box.get(id);
  }

  Future<void> updateTask({required TaskModel task}) async {
    await task.save();
  }

  Future<void> deleteTask({required TaskModel task}) async {
    await task.delete();
  }

  ValueListenable<Box<TaskModel>> listenToTask() => box.listenable();
}
