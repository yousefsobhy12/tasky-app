import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky/features/tasks/widgets/custom_text_and_textfield_widget.dart';
import 'package:tasky/features/tasks/widgets/priority_dialog_widget.dart';

// ignore: must_be_immutable
class CustomModalBottomSheet extends StatelessWidget {
  CustomModalBottomSheet({
    super.key,
    required this.taskController,
    required this.descController,
    this.onSave,
    this.onSavePriority,required this.selectedIndex,
  });

  final TextEditingController taskController;
  final TextEditingController descController;
  void Function(int)? onSavePriority;
  void Function()? onSave;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 25,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextAndTextField(
            hintText: 'Do math homework',
            title: 'Add Task',
            controller: taskController,
          ),
          SizedBox(height: 13),
          CustomTextAndTextField(
            hintText: 'Add description for your task',
            title: 'Description',
            controller: descController,
          ),
          SizedBox(height: 35),
          SafeArea(
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/timer_icon.svg'),
                SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return PriorityDialogWidget(selectedIndex: selectedIndex,onSavePriority: onSavePriority,);
                      },
                    );
                  },
                  child: SvgPicture.asset('assets/icons/flag_icon.svg'),
                ),
                Spacer(),
                GestureDetector(
                  onTap: onSave,
                  child: SvgPicture.asset('assets/icons/submit_icon.svg'),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
