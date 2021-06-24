import 'package:flutter/material.dart';
import 'package:haul_pra/constants/constants.dart';

class OutlinedDivider extends StatelessWidget {
  const OutlinedDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 36.0),
      height: 5.0,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        border: Border.all(color: Colors.black, width: 0.5),
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
  }
}
