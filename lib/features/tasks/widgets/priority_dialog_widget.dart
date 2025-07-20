import 'package:flutter/material.dart';
import 'package:tasky/features/tasks/widgets/priority_container_widget.dart';
import 'package:tasky/features/tasks/widgets/priority_dialog_button.dart';

class PriorityDialogWidget extends StatefulWidget {
  const PriorityDialogWidget({super.key});

  @override
  State<PriorityDialogWidget> createState() => _PriorityDialogWidgetState();
}

class _PriorityDialogWidgetState extends State<PriorityDialogWidget> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(4),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Task Priority',
            style: TextStyle(
              color: Color(0xff24252C),
              fontSize: 16,
              fontFamily: 'lato',
              fontWeight: FontWeight.w900,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 12),
            child: Divider(color: Color(0xff979797)),
          ),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            children: List.generate(10, (index) {
              return PriorityContainerWidget(
                index: index,
                isSelected: selectedIndex == index,
                onTap: () {
                  selectedIndex = index;
                  setState(() {});
                },
              );
            }),
          ),
          SizedBox(height: 20),
          Row(
            spacing: 15,
            children: [
              PriorityDialogButton(
                backgroundColor: Colors.white,
                textColor: Color(0xff5F33E1),
                title: 'Cancel',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              PriorityDialogButton(
                backgroundColor: Color(0xff5F33E1),
                textColor: Colors.white,
                title: 'Save',
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
