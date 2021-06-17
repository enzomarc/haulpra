import 'package:flutter/material.dart';
import 'package:haul_pra/constants/app_colors.dart';
import 'package:haul_pra/helpers/helpers.dart';
import 'package:haul_pra/ui/authentication/authentication.dart';

class ToggleButton extends StatefulWidget {
  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

const double width = 300.0;
const double height = 60.0;
const double loginAlign = -1;
const double signInAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.black54;

class _ToggleButtonState extends State<ToggleButton> {
  late double xAlign;
  late Color loginColor;
  late Color signInColor;
  Color selectedColor = Colors.white;
  Color normalColor = Colors.black;

  @override
  void initState() {
    super.initState();
    xAlign = loginAlign;
    loginColor = selectedColor;
    signInColor = normalColor;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.grey)
        ),
        child: Stack(
          children: [
            // AnimatedAlign(
            //   alignment: Alignment(xAlign, 0),
            //   duration: Duration(milliseconds: 300),
            //   child: Container(
            //     width: width * 0.5,
            //     height: height,
            //     decoration: BoxDecoration(
            //       color: AppColors.orange,
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(50.0),
            //       ),
            //     ),
            //   ),
            // ),
            InkWell(
              onTap: () {
                print(">>>> Signin button pressed");
              },
              child: Align(
                alignment: Alignment(-1, 0),
                child: Container(
                  width: width * 0.5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                AppNavigator.changeScreen(RegistrationSelectionPage());
              },
              child: Align(
                alignment: Alignment(1, 0),
                child: Container(
                  width: width * 0.5,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}