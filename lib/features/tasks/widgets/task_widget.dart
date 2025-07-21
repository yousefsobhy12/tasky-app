import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/utils/app_dialog.dart';
import 'package:tasky/data/firebase/firebase_database.dart';
import 'package:tasky/data/models/task_model.dart';
import 'package:tasky/features/tasks/widgets/custom_modal_bottom_sheet.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
    required this.taskModel,
    required this.onDismiss,
    required this.onUpdate,
  });

  final TaskModel taskModel;
  final VoidCallback onDismiss;
  final VoidCallback onUpdate;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(taskModel.id), // Ensure unique key per task

      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () async {
            AppDialog.showLoadingDialog(context);
            await FirebaseDatabase.deleteTask(taskModel);
            Navigator.pop(context); // Close loading dialog
            onDismiss(); // Remove task from UI
          },
        ),
        extentRatio: 0.2,
        children: [
          SlidableAction(
            onPressed: (_) {},
            backgroundColor: const Color(0xFFFE4A49),
            borderRadius: BorderRadius.circular(10),
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),

      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              final taskController = TextEditingController(text: taskModel.title);
              final descController = TextEditingController(text: taskModel.description);
              int selectedPriority = taskModel.priority - 1;

              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context, setSheetState) {
                      return CustomModalBottomSheet(
                        taskController: taskController,
                        descController: descController,
                        selectedIndex: selectedPriority,
                        onSavePriority: (index) {
                          setSheetState(() {
                            selectedPriority = index;
                          });
                        },
                        onSave: () async {
                          AppDialog.showLoadingDialog(context);
                          await FirebaseDatabase.updateTask(
                            taskModel.copyWith(
                              title: taskController.text,
                              description: descController.text,
                              priority: selectedPriority + 1,
                            ),
                          );
                          Navigator.pop(context); // close loading
                          Navigator.pop(context); // close bottom sheet
                          onUpdate(); // tell parent to refresh list
                        },
                      );
                    },
                  );
                },
              );
            },
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Colors.white,
            borderRadius: BorderRadius.circular(10),
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),

      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFF6E6A7C)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 12),
              width: 16,
              height: 16,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: const OvalBorder(
                  side: BorderSide(width: 1.5, color: Color(0xFF5F33E1)),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskModel.title,
                  style: const TextStyle(
                    color: Color(0xff24252C),
                    fontSize: 16,
                    fontFamily: 'lato',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${taskModel.dateTime.day}/${taskModel.dateTime.month}/${taskModel.dateTime.year}',
                  style: const TextStyle(
                    color: Color(0xFF6E6A7C),
                    fontSize: 14,
                    fontFamily: 'lato',
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    letterSpacing: -0.32,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1.7, color: Color(0xFF5F33E1)),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/flag_icon.svg'),
                  const SizedBox(width: 5),
                  Text(
                    taskModel.priority.toString(),
                    style: const TextStyle(
                      color: Color(0xFF24252C),
                      fontSize: 12,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                      height: 1.75,
                      letterSpacing: -0.32,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
