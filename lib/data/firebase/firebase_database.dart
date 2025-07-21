import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasky/data/models/task_model.dart';
import 'package:tasky/data/models/user_model.dart';

abstract class FirebaseDatabase {
  static CollectionReference collectionUser() {
    return FirebaseFirestore.instance
        .collection('users')
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  // Create a new user in the database
  static Future<void> createUser(UserModel user) async {
    return await collectionUser().doc(user.id).set(user);
  }

  // Get a user by ID
  static Future<UserModel?> getUser(String userId) async {
    var data = await collectionUser().doc(userId).get();
    return data.data() as UserModel?;
  }

  // collection for tasks
  static CollectionReference<TaskModel> collectionTasks() {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    return collectionUser()
        .doc(userId)
        .collection('tasks')
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
          toFirestore: (task, _) => task.toJson(),
        );
  }

  static Future<void> addTask({
    required String title,
    required String description,
    required int priority,
    required DateTime date,
  }) async {
    // await collectionTasks().doc().set(task);
    var docRef = collectionTasks().doc();
    var userId = docRef.id;
    TaskModel userTask = TaskModel(
      id: userId,
      title: title,
      description: description,
      priority: priority,
      dateTime: date,
    );
    docRef.set(userTask);
  }

  static Future<List<TaskModel>> getTasks() async {
    var listOfTasks = await collectionTasks().get();
    return listOfTasks.docs.map((task) => task.data()).toList();
  }

  //update a task
  static Future<void> updateTask(TaskModel task) async {
    return await collectionTasks().doc(task.id).update(task.toJson());
  }

  // Delete a task
  static Future<void> deleteTask(TaskModel task) async {
    return collectionTasks().doc(task.id).delete();
  }
}
