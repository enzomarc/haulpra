import 'package:flutter/material.dart';
import 'package:haul_pra/constants/app_colors.dart';
import 'package:haul_pra/constants/constants.dart';
import 'package:haul_pra/helpers/helpers.dart';
import 'package:haul_pra/ui/authentication/authentication.dart';
import 'package:haul_pra/ui/shared/shared.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordController2.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileNumberController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _zipController.dispose();
    _stateController.dispose();
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
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Logo(radius: 26.0),
                          SizedBox(height: 8.0),
                          Medium24Gray(Strings.CLIENT_SIGN_UP),
                          SizedBox(height: 12.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: RoundedInputField(_firstNameController, "First name")),
                              SizedBox(width: 8.0),
                              Expanded(child: RoundedInputField(_lastNameController, "Last name")),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          RoundedInputField(_emailController, "Email"),
                          SizedBox(height: 8.0),
                          RoundedInputField(_mobileNumberController, "Mobile number"),
                          SizedBox(height: 8.0),
                          RoundedInputField(_passwordController, "Password", obscureText: true),
                          SizedBox(height: 8.0),
                          RoundedInputField(_passwordController2, "Confirm password", obscureText: true),
                          SizedBox(height: 8.0),
                          RoundedInputField(_addressController, "Street address"),
                          SizedBox(height: 8.0),
                          RoundedInputField(_cityController, "City"),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: RoundedInputField(_stateController, "State")),
                              SizedBox(width: 8.0),
                              Expanded(child: RoundedInputField(_zipController, "Zip code")),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          _getRegistrationButton(),
                          SizedBox(height: 16.0),
                        ],
                      ),
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

  RoundedCornerButton _getRegistrationButton() {
    return RoundedCornerButton(
      Strings.NEXT_STEP,
      _onRegistrationButtonPressed,
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

  Container _getBackgroundDecoration(Size size) {
    return Container(
      height: size.height/1.3,
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

  _onRegistrationButtonPressed() {
    AppNavigator.changeScreen(PaymentDetailsPage());
  }

  _googleCallback() {
    print(">>>> Google button pressed...");
  }

  _facebookCallback() {
    print(">>>> Facebook button pressed...");
  }
}
