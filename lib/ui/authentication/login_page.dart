import 'package:flutter/material.dart';
import 'package:haul_pra/constants/app_colors.dart';
import 'package:haul_pra/constants/constants.dart';
import 'package:haul_pra/ui/shared/shared.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _getBackgroundDecoration(size),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _getProjectNameWithLogo(),
                  SizedBox(height: 8.0),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: SingleChildScrollView(
                      child: Container(
                        width: size.width - 56.0,
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            _getLoginButton(),
                            SizedBox(height: 8.0),
                            Regular18Black(Strings.OR),
                            SizedBox(height: 8.0),
                            _getSocialButtons(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  RoundedCornerButton _getLoginButton() {
    return RoundedCornerButton(
      Strings.LOGIN_BUTTON,
      _onLoginButtonPressed,
      AppColors.orange,
      Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 64.0, vertical: 10.0),
    );
  }

  Widget _getSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Image.asset(AssetConstants.GOOGLE),
          onPressed: _googleCallback,
        ),
        SizedBox(width: 10.0),
        IconButton(
          icon: Image.asset(AssetConstants.FACEBOOK),
          onPressed: _facebookCallback,
        ),
      ],
    );
  }

  _googleCallback() {
    print(">>>> Google button pressed...");
  }

  _facebookCallback() {
    print(">>>> Facebook button pressed...");
  }

  Row _getProjectNameWithLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Logo(),
        SizedBox(width: 8.0),
        ProjectName(36, Colors.white),
      ],
    );
  }

  Container _getBackgroundDecoration(Size size) {
    return Container(
      height: size.height/2,
      width: size.width,
      decoration: BoxDecoration(
        color: AppColors.orange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(120),
          bottomRight: Radius.circular(120),
        ),
      ),
    );
  }

  _onLoginButtonPressed() {
    print(">>>> Login button tapped...");
  }
}
