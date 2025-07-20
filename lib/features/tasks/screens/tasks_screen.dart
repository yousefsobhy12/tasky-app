import 'package:flutter/material.dart';
import 'package:tasky/core/widgets/custom_app_bar.dart';
import 'package:tasky/features/tasks/widgets/task_widget.dart';
import '../widgets/custom_modal_bottom_sheet.dart';
import '../widgets/days_custom_container_widget.dart';

// ignore: must_be_immutable
class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});

  static const String pageRoute = 'TasksScreen';
  TextEditingController taskController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              TaskWidget(),
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
}
