import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:haul_pra/constants/app_colors.dart';

class IconButtonWithText extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onPressed;

  const IconButtonWithText(this.text, this.isSelected, this.onPressed, this.icon);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(136, 136), // button width and height
      child: ClipOval(
        child: Material(
          color: isSelected ? AppColors.orange : Colors.white, // button color
          child: InkWell(
            splashColor: Colors.orange, // splash color
            onTap: onPressed, // button pressed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FaIcon(
                  icon,
                  color: isSelected ? Colors.white : AppColors.orange,
                  size: 50.0,
                ), // icon
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: isSelected ? Colors.white : AppColors.orange,
                    fontWeight: FontWeight.w500,
                  ),
                ), // text
              ],
            ),
          ),
        ),
      ),
    );
  }
}
