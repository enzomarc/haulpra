import 'package:flutter/material.dart';
import 'package:haul_pra/ui/shared/shared.dart';

class TwoButtonRow extends StatelessWidget {
  final Color firstButtonColor;
  final Color secondButtonColor;
  final String firstButtonText;
  final String secondButtonText;
  final VoidCallback firstButtonCallback;
  final VoidCallback secondButtonCallback;

  const TwoButtonRow({
    Key? key,
    required this.firstButtonColor,
    required this.secondButtonColor,
    required this.firstButtonText,
    required this.secondButtonText,
    required this.firstButtonCallback,
    required this.secondButtonCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 56.0;
    double width = MediaQuery.of(context).size.width - 50.0;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(40.0)),
      ),
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: secondButtonColor,
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
            ),
          ),
          _buttonRow(width, height),
        ],
      ),
    );
  }

  Row _buttonRow(double width, double height) {
    return Row(
      children: [
        InkWell(
          onTap: firstButtonCallback,
          child: Container(
            width: width/2,
            height: height,
            decoration: BoxDecoration(
              color: firstButtonColor,
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
            ),
            child: Center(child: Bold18White(firstButtonText)),
          ),
        ),
        InkWell(
          onTap: secondButtonCallback,
          child: Container(
            width: width/2,
            height: height,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
            ),
            child: Center(child: Bold18White(secondButtonText)),
          ),
        ),
      ],
    );
  }
}
