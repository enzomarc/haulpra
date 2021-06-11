import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:haul_pra/constants/constants.dart';
import 'package:haul_pra/ui/shared/shared.dart';

class RegistrationSelectionPage extends StatefulWidget {
  const RegistrationSelectionPage({Key? key}) : super(key: key);

  @override
  _RegistrationSelectionPageState createState() => _RegistrationSelectionPageState();
}

class _RegistrationSelectionPageState extends State<RegistrationSelectionPage> {
  List<bool> selectedIcon = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Medium24Gray(Strings.SELECT_ROLE, textAlign: TextAlign.center),
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButtonWithText(
                    Strings.CLIENT,
                    selectedIcon[0],
                    _selectClient,
                    FontAwesomeIcons.userTie,
                  ),
                  IconButtonWithText(
                    Strings.SERVICE_PROVIDER,
                    selectedIcon[1],
                    _selectServiceProvider,
                    FontAwesomeIcons.users,
                  ),
                ],
              ),
              SizedBox(height: 40.0),
              RoundedCornerButton(
                Strings.GET_STARTED,
                _onGetStartedButtonPressed,
                AppColors.orange,
                Colors.white,
              ),
              SizedBox(height: 36.0),
              _getTnCText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getTnCText() {
    return Column(
      children: [
        Text(
          "By continuing you agree to our",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                print("Hello");
              },
              child: Text(
                "Terms ",
                style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Text(
              "and ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
            GestureDetector(
              onTap: () {
                print("Hello");
              },
              child: Text(
                "Privacy policy.",
                style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _selectClient() {
    setState(() {
      selectedIcon[0] = true;
      selectedIcon[1] = false;
    });
  }

  _selectServiceProvider() {
    setState(() {
      selectedIcon[0] = false;
      selectedIcon[1] = true;
    });
  }

  _onGetStartedButtonPressed() {
    print("Hello");
  }
}
