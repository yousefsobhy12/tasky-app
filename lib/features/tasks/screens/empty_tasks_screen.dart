import 'package:flutter/material.dart';
import 'package:tasky/core/widgets/custom_app_bar.dart';
import 'package:tasky/features/tasks/widgets/custom_modal_bottom_sheet.dart';

// ignore: must_be_immutable
class EmptyTasksScreen extends StatelessWidget {
  EmptyTasksScreen({super.key});
  static const String pageRoute = 'EmptyTasksScreen';
  TextEditingController taskController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBarWidget(),
              SizedBox(height: 85),
              Image.asset('assets/images/tasks_screen_image.png'),
              SizedBox(height: 15),
              Text(
                'What do you want to do today?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff24252C), fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'Tap + to add your tasks',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff24252C), fontSize: 16),
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
