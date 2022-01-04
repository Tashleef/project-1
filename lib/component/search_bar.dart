import 'package:flutter/material.dart';

import '../constant.dart';
class CustomTextField extends StatelessWidget {
  final hintText;
  final icon;
  CustomTextField({this.icon,this.hintText});
  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: icon,
            fillColor: kPrimaryColor.withOpacity(0.4),
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: kPrimaryColor
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: kPrimaryColor
                )
            )


        )
    );
  }
}