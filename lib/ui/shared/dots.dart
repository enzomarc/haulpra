import 'package:flutter/material.dart';
import 'package:haul_pra/constants/app_colors.dart';

class Dots extends StatelessWidget {
  final int totalDots;
  final int index;
  const Dots(this.totalDots, this.index);

  @override
  Widget build(BuildContext context) {
    List<Widget> _dots = [SizedBox(width: 8.0)];
    for (int i=1; i<=totalDots; i++) {
      _dots.add(_getDot(i));
      _dots.add(SizedBox(width: 8.0));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _dots,
    );
  }

  _getDot(int i) {
    return Container(
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Container(
        width: 16.0,
        height: 16.0,
        decoration: BoxDecoration(
          color: index == i ? AppColors.orange : Colors.white,
          border: Border.all(color: index == i ? AppColors.orange : Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
