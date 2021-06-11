import 'package:flutter/material.dart';
import 'package:haul_pra/constants/constants.dart';

class ProjectName extends StatelessWidget {
  final double fontSize;
  final Color textColor;
  const ProjectName(this.fontSize, this.textColor);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: Strings.HAUL,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
        ),
        children: <TextSpan>[
          TextSpan(
            text: Strings.PRA,
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
