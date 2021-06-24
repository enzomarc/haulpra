import 'package:flutter/material.dart';

class ColoredCircle extends StatelessWidget {
  final Color color;
  final double size;

  const ColoredCircle({
    Key? key,
    required this.color,
    this.size = 26.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: color),
        borderRadius: BorderRadius.all(Radius.circular(size*2)),
      ),
    );
  }
}
