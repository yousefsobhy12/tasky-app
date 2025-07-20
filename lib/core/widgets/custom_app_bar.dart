import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/logo.png', alignment: Alignment.topLeft),
        Spacer(),
        SvgPicture.asset('assets/icons/logout_icon.svg'),
        SizedBox(width: 10),
        Text(
          'Log out',
          style: TextStyle(
            color: Colors.red,
            fontSize: 16,
            fontFamily: 'lato',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
