import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final String? text;
  final IconData? icon;

  IconWidget({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text!,
          style: TextStyle(
              fontSize: 20, color: Colors.black54, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
