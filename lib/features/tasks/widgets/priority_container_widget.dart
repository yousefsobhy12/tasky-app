import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class PriorityContainerWidget extends StatelessWidget {
  PriorityContainerWidget({
    super.key,
    required this.index,
    this.onTap,
    required this.isSelected,
  });
  final bool isSelected;
  final int index;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff5F33E1) : Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: isSelected
              ? null
              : Border.all(color: Color(0xff6E6A7C), width: 1.2),
        ),
        child: Column(
          spacing: 4,
          children: [
            SvgPicture.asset(
              'assets/icons/flag_icon.svg',
              // ignore: deprecated_member_use
              color: isSelected ? Colors.white : Color(0xff5F33E1),
            ),
            Text(
              '${index + 1}',
              style: TextStyle(
                color: isSelected ? Colors.white : Color(0xff24252C),
                fontSize: 16,
                fontFamily: 'lato',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
