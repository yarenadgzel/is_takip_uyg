import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:is_takip_uyg/models/Task.dart';
class DatabaseServiceTask{
  final CollectionReference taskRef = Firestore.instance.collection("tasks");

  createTask(Task task) async {
    await taskRef.document(task.taskID).setData(
      task.toJson()
    );
  }
  updateTask(Task task) async {
    await taskRef.document(task.taskID).updateData(
        task.toJson()
    );
  }
  deleteTask(Task task) async {
    await taskRef.document(task.taskID).delete();
  }
  getTasksData() {
    return taskRef.snapshots();
  }
}