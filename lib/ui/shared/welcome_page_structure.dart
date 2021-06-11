import 'package:flutter/material.dart';

class WelcomePageStructure extends StatelessWidget {
  final int dotIndex;
  final String text;
  final String assetPath;

  const WelcomePageStructure(this.dotIndex, this.text, this.assetPath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          ],
        ),
      ),
    );
  }
}
