import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextAndTextFormField extends StatelessWidget {
  CustomTextAndTextFormField({
    super.key,
    required this.hintText,
    required this.title,
    this.suffixIcon,
    required this.controller,
    this.validator,
  });
  final String title;
  final String hintText;
  IconButton? suffixIcon;
  final TextEditingController controller;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color(0xff6E6A7C),
            fontSize: 16,
            fontFamily: 'lato',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
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
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: borderColor),
  );
}
