import 'package:flutter/material.dart';

import '../constant.dart';
class CustomTextField extends StatelessWidget {
  final hintText;
  final icon;
  final function;
  final hidden;
  final color;
  CustomTextField({this.icon,this.hintText,this.function,this.hidden,this.color});
  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: Colors.white.withOpacity(0.3),
        onChanged: function,
        obscureText: hidden,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon:  icon,

            fillColor: (color == null)? Colors.white.withOpacity(0.4):color,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:  BorderSide(
                    color: (color == null)? Colors.white.withOpacity(0.4):color,
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: (color == null)? Colors.white.withOpacity(0.4):color,
                )
            )


        )
    );
  }
}