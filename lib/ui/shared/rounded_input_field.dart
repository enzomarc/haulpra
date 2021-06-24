import 'package:flutter/material.dart';
import 'package:haul_pra/constants/app_colors.dart';

class RoundedInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscureText;
  final Color borderColor;

  RoundedInputField(
    this.controller,
    this.hint, {
    this.obscureText=false,
    this.borderColor=AppColors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.black),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
        ),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
