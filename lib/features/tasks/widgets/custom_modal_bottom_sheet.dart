import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky/features/tasks/widgets/custom_text_and_textfield_widget.dart';
import 'package:tasky/features/tasks/widgets/priority_dialog_widget.dart';

class CustomModalBottomSheet extends StatelessWidget {
  const CustomModalBottomSheet({
    super.key,
    required this.taskController,
    required this.descController,
  });

  final TextEditingController taskController;
  final TextEditingController descController;

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
                        return PriorityDialogWidget();
                      },
                    );
                  },
                  child: SvgPicture.asset('assets/icons/flag_icon.svg'),
                ),
                Spacer(),
                SvgPicture.asset('assets/icons/submit_icon.svg'),
              ],
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
