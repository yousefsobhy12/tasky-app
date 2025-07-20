import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),

      startActionPane: ActionPane(
        motion: const ScrollMotion(),

        dismissible: DismissiblePane(onDismissed: () {}),
        extentRatio: 0.2,
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Color(0xFFFE4A49),
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
            onPressed: (context) {},
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Colors.white,
            borderRadius: BorderRadius.circular(10),
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: const Color(0xFF6E6A7C)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 12),
              width: 16,
              height: 16,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: OvalBorder(
                  side: BorderSide(width: 1.50, color: const Color(0xFF5F33E1)),
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  'Do Math Homework',
                  style: TextStyle(
                    color: const Color(0xff24252C),
                    fontSize: 16,
                    fontFamily: 'lato',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Today At 16:45',
                  style: TextStyle(
                    color: const Color(0xFF6E6A7C),
                    fontSize: 14,
                    fontFamily: 'lato',
                    fontWeight: FontWeight.w500,
                    height: 1.50,
                    letterSpacing: -0.32,
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.7, color: const Color(0xFF5F33E1)),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 5,
                children: [
                  SvgPicture.asset('assets/icons/flag_icon.svg'),
                  Text(
                    '1',
                    style: TextStyle(
                      color: const Color(0xFF24252C),
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
