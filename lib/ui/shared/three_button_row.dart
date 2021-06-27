import 'package:flutter/material.dart';
import 'package:haul_pra/ui/shared/shared.dart';

class ThreeButtonRow extends StatelessWidget {
  final Color firstButtonColor;
  final Color secondButtonColor;
  final Color thirdButtonColor;
  final String firstButtonText;
  final String secondButtonText;
  final String thirdButtonText;
  final VoidCallback firstButtonCallback;
  final VoidCallback secondButtonCallback;
  final VoidCallback thirdButtonCallback;

  const ThreeButtonRow({
    Key? key,
    required this.firstButtonColor,
    required this.secondButtonColor,
    required this.thirdButtonColor,
    required this.firstButtonText,
    required this.secondButtonText,
    required this.thirdButtonText,
    required this.firstButtonCallback,
    required this.secondButtonCallback,
    required this.thirdButtonCallback,
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
          _backgroundLayer(width, height),
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
            width: width/3,
            height: height,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                bottomLeft: Radius.circular(40.0),
              ),
            ),
            child: Center(child: Bold18White(firstButtonText)),
          ),
        ),
        InkWell(
          onTap: secondButtonCallback,
          child: Container(
            width: width/3,
            height: height,
            decoration: BoxDecoration(
              color: secondButtonColor,
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
            ),
            child: Center(child: Bold18White(secondButtonText)),
          ),
        ),
        InkWell(
          onTap: thirdButtonCallback,
          child: Container(
            width: width/3,
            height: height,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
            ),
            child: Center(child: Bold18White(thirdButtonText)),
          ),
        ),
      ],
    );
  }

  Row _backgroundLayer(double width, double height) {
    return Row(
      children: [
        Container(
          width: width/2,
          height: height,
          decoration: BoxDecoration(
            color: firstButtonColor,
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
          ),
        ),
        Container(
          width: width/2,
          height: height,
          decoration: BoxDecoration(
            color: thirdButtonColor,
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
          ),
        ),
      ],
    );
  }
}
