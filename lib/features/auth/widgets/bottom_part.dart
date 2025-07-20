import 'package:flutter/material.dart';

class AuthScreensLowerPart extends StatelessWidget {
  const AuthScreensLowerPart({
    super.key,
    required this.title,
    required this.subTitle,
    this.onTap,
  });
  final String title;
  final String subTitle;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Color(0xff6E6A7C),
                fontSize: 14,
                fontFamily: 'lato',
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              subTitle,
              style: TextStyle(
                color: Color(0xff5F33E1),
                fontSize: 14,
                fontFamily: 'lato',
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
              text: title,
              style: TextStyle(
                color: Color(0xff6E6A7C),
                fontSize: 14,
                fontFamily: 'lato',
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: subTitle,
              style: TextStyle(
                color: Color(0xff5F33E1),
                fontSize: 14,
                fontFamily: 'lato',
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),

*/
