import 'package:flutter/material.dart';
import 'package:haul_pra/constants/constants.dart';
import 'package:haul_pra/helpers/helpers.dart';
import 'package:haul_pra/ui/authentication/authentication.dart';
import 'package:haul_pra/ui/shared/shared.dart';

class WelcomePageStructure extends StatelessWidget {
  final int pageIndex;
  final String text;
  final String assetPath;

  const WelcomePageStructure(this.pageIndex, this.text, this.assetPath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              ProjectName(32, Colors.black),
              SizedBox(height: 24.0),
              Image.asset(assetPath),
              Regular18Black(text, textAlign: TextAlign.center),
              Spacer(flex: 1),
              Dots(3, pageIndex),
              SizedBox(height: 12.0),
              RoundedCornerButton(
                Strings.SKIP,
                _onSkipButtonPressed,
                Colors.white,
                Colors.black,
                isOutlined: true,
                fontSize: 20.0,
                padding: EdgeInsets.symmetric(horizontal: 56.0, vertical: 14.0),
              ),
              SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
  
  _onSkipButtonPressed() {
    AppNavigator.changeScreen(RegistrationSelectionPage());
  }
}
