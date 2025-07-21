import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_dialog.dart';
import 'package:tasky/core/widgets/custom_app_bar.dart';
import 'package:tasky/data/firebase/firebase_database.dart';
import 'package:tasky/data/models/task_model.dart';
import 'package:tasky/features/tasks/screens/empty_tasks_screen.dart';
import 'package:tasky/features/tasks/widgets/task_widget.dart';
import '../widgets/custom_modal_bottom_sheet.dart';
import '../widgets/days_custom_container_widget.dart';

// ignore: must_be_immutable
class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  static const String pageRoute = 'TasksScreen';

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  TextEditingController taskController = TextEditingController();
  TextEditingController descController = TextEditingController();
  int priority = 0;
  DateTime selectedDate = DateTime.now();
  List<TaskModel> tasks = [];
  @override
  void initState() {
    super.initState();
    getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? EmptyTasksScreen()
        : Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBarWidget(),
                    SizedBox(height: 43),
                    DaysCustomContainerWidget(),
                    SizedBox(height: 18),
                    Expanded(
                      child: ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return TaskWidget(
                            taskModel: tasks[index],
                            onDismiss: () {
                              setState(() {
                                tasks.removeAt(index);
                              });
                            },
                            onUpdate: () {
                              taskController.text = tasks[index].title;
                              descController.text = tasks[index].description;
                              priority = tasks[index].priority - 1;
                              selectedDate = tasks[index].dateTime;

                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return CustomModalBottomSheet(
                                    taskController: taskController,
                                    descController: descController,
                                    selectedIndex: priority,
                                    onSavePriority: (index) {
                                      priority = index;
                                    },
                                    onSave: () async {
                                      AppDialog.showLoadingDialog(context);
                                      final updatedTask = tasks[index].copyWith(
                                        title: taskController.text,
                                        description: descController.text,
                                        priority: priority + 1,
                                        dateTime: selectedDate,
                                      );
                                      await FirebaseDatabase.updateTask(
                                            updatedTask,
                                          )
                                          .then((_) async {
                                            Navigator.pop(
                                              context,
                                            ); // close loading
                                            Navigator.pop(
                                              context,
                                            ); // close modal sheet
                                            await getTasks(); // refresh task list
                                            taskController.clear();
                                            descController.clear();
                                            priority = 0;
                                            selectedDate = DateTime.now();
                                          })
                                          .onError((error, stackTrace) {
                                            Navigator.pop(
                                              context,
                                            ); // close loading
                                            AppDialog.showErrorDialog(
                                              context,
                                              'Failed to update task.',
                                            );
                                          });
                                    },
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return CustomModalBottomSheet(
                      taskController: taskController,
                      descController: descController,
                      onSave: () async {
                        log(
                          'Task: ${taskController.text}, Description: ${descController.text}, Priority: ${priority + 1}, Date: $selectedDate',
                        );
                        AppDialog.showLoadingDialog(context);
                        await FirebaseDatabase.addTask(
                              title: taskController.text,
                              description: descController.text,
                              priority: priority + 1,
                              date: selectedDate,
                            )
                            .then((_) async {
                              Navigator.pop(context);
                              taskController.clear();
                              descController.clear();
                              priority = 0;
                              selectedDate = DateTime.now();
                              Navigator.pop(context);
                              await getTasks();
                            })
                            .onError((error, stackTrace) {
                              log('Error adding task: $error');
                              Navigator.pop(context);
                              AppDialog.showErrorDialog(
                                context,
                                'Failed to add task. Please try again.',
                              );
                            });
                      },

                      selectedIndex: priority,
                      onSavePriority: (index) {
                        priority = index;
                      },
                    );
                  },
                );
              },
              backgroundColor: Color(0xff24252C),
              shape: CircleBorder(),
              heroTag: 'addTask',
              child: Icon(Icons.add, color: Color(0xff5F33E1)),
            ),
          );
  }

  Future<void> getTasks() async {
    final fetchedTasks = await FirebaseDatabase.getTasks();

    if (fetchedTasks.isNotEmpty) {
      AppDialog.showLoadingDialog(context); // show loading dialog
      await Future.delayed(Duration(seconds: 3)); // wait 3 seconds
      Navigator.pop(context); // dismiss loading dialog
    }

    tasks = fetchedTasks;
    tasks.sort((a, b) => a.priority.compareTo(b.priority));
    setState(() {});
  }
}
