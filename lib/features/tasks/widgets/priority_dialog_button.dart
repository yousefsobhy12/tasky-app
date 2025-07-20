import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PriorityDialogButton extends StatelessWidget {
  PriorityDialogButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.title,
    this.onPressed,
  });
  final String title;
  final Color backgroundColor;
  final Color textColor;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(4),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        elevation: 0,
        color: backgroundColor,
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontFamily: 'lato',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
