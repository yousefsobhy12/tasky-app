import 'package:flutter/material.dart';

abstract class AppDialog {
  static showLoadingDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16,
            children: [
              CircularProgressIndicator(
                color: Color(0xff5F33E1),
                padding: EdgeInsets.only(right: 20),
              ),
              Text(
                'Loading...',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static showErrorDialog(BuildContext context, String errorMessage) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Oopsss...',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          content: Text(
            errorMessage,
            style: TextStyle(fontSize: 15, color: Colors.red),
          ),
        );
      },
    );
  }
}
