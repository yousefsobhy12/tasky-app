import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Color(0xff5F33E1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      minWidth: double.infinity,
      height: 48,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'lato',
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
