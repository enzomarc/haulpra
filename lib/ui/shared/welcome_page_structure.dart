import 'package:flutter/material.dart';
import 'package:haul_pra/ui/shared/project_name.dart';
import 'package:haul_pra/ui/shared/shared.dart';

class WelcomePageStructure extends StatelessWidget {
  final int dotIndex;
  final String text;
  final String assetPath;

  const WelcomePageStructure(this.dotIndex, this.text, this.assetPath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProjectName(32, Colors.black),
              Image.asset(assetPath),
              Regular18Black(text),
              Dots(3, dotIndex),
            ],
          ),
        ),
      ),
    );
  }
}
