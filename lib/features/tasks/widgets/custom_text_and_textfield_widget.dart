import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextAndTextField extends StatelessWidget {
  CustomTextAndTextField({
    super.key,
    required this.hintText,
    required this.title,
    this.suffixIcon,
    required this.controller,
  });
  final String title;
  final String hintText;
  IconButton? suffixIcon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color(0xff24252C),
            fontSize: 20,
            fontFamily: 'lato',
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color(0xff6E6A7C),
              fontSize: 18,
              fontFamily: 'lato',
              fontWeight: FontWeight.w400,
            ),
            suffixIcon:
                suffixIcon ?? Icon(Icons.abc, color: Colors.transparent),
            suffixIconColor: Colors.grey,
            enabledBorder: outlineInputBorder(borderColor: Color(0xffBABABA)),
            focusedBorder: outlineInputBorder(borderColor: Color(0xffBABABA)),
            errorBorder: outlineInputBorder(borderColor: Colors.red),
          ),
        ),
      ],
    );
  }
}

OutlineInputBorder outlineInputBorder({required Color borderColor}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: borderColor),
  );
}
