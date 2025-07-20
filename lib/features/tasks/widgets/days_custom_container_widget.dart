import 'package:flutter/material.dart';

class DaysCustomContainerWidget extends StatelessWidget {
  const DaysCustomContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Color(0xff6E6A7C)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Today',
              style: TextStyle(
                color: Color(0xff24252C),
                fontSize: 16,
                fontFamily: 'lato',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.keyboard_arrow_down_outlined, color: Color(0xff5F33E1)),
          ],
        ),
      ),
    );
  }
}
