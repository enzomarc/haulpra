import 'package:flutter/material.dart';
import 'package:haul_pra/constants/constants.dart';

class OutlinedDivider extends StatelessWidget {
  final double height;
  final EdgeInsets margin;

  const OutlinedDivider({
    Key? key,
    this.height=5.0,
    this.margin=const EdgeInsets.symmetric(horizontal: 36.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        border: Border.all(color: Colors.black, width: 0.5),
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
  }
}
