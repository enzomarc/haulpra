import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:haul_pra/constants/constants.dart';

class Logo extends StatelessWidget {
  final double radius;
  const Logo({Key? key, this.radius=40.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      padding: EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(AssetConstants.APP_LOGO),
        backgroundColor: Colors.white,
      ),
    );
  }
}
