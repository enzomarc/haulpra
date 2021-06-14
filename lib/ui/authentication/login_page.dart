import 'package:flutter/material.dart';
import 'package:haul_pra/constants/app_colors.dart';
import 'package:haul_pra/constants/constants.dart';
import 'package:haul_pra/helpers/helpers.dart';
import 'package:haul_pra/ui/authentication/authentication.dart';
import 'package:haul_pra/ui/shared/shared.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _getBackgroundDecoration(size),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.0),
                      _getProjectNameWithLogo(),
                      SizedBox(height: 8.0),
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          width: size.width - 56.0,
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              SizedBox(height: 8.0),
                              ToggleButton(),
                              SizedBox(height: 12.0),
                              _getEmailField(),
                              _getPasswordField(),
                              _getForgotPasswordText(),
                              SizedBox(height: 12.0),
                              _getLoginButton(),
                              SizedBox(height: 8.0),
                              Regular18Black(Strings.OR),
                              SizedBox(height: 8.0),
                              _getSocialButtons(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getEmailField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: TextField(
        style: TextStyle(color: Colors.black),
        controller: _emailController,
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.orange),
          ),
          hintText: 'Enter Email',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _getPasswordField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: TextField(
        style: TextStyle(color: Colors.black),
        controller: _passwordController,
        obscureText: _obscureText,
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.orange),
          ),
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.grey),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _getForgotPasswordText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: _onForgotPasswordButtonPressed,
          child: Regular16Black("Forgot password"),
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
    AppNavigator.changeScreen(RegistrationSelectionPage());
  }

  _onForgotPasswordButtonPressed() {
    print(">>>> Forgot password button tapped...");
  }

  _googleCallback() {
    print(">>>> Google button pressed...");
  }

  _facebookCallback() {
    print(">>>> Facebook button pressed...");
  }
}
