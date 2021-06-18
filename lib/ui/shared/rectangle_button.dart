import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  final double fontSize;
  final bool isOutlined;
  final EdgeInsets? padding;

  const RectangleButton(this.text, this.onPressed, this.buttonColor, this.textColor, {this.fontSize=18.0, this.isOutlined=false, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 8.0,
          padding: padding == null ? EdgeInsets.symmetric(horizontal: 26.0, vertical: 10.0) : padding,
          primary: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            // side: isOutlined ? BorderSide(color: Colors.black) : BorderSide.none,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
