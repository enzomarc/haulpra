import 'package:flutter/material.dart';
import 'package:haul_pra/constants/constants.dart';
import 'package:haul_pra/helpers/helpers.dart';
import 'package:haul_pra/ui/shared/shared.dart';

import 'brand_selection_page.dart';

class PickupServiceSelectionPage extends StatefulWidget {
  const PickupServiceSelectionPage({Key? key}) : super(key: key);

  @override
  _PickupServiceSelectionPageState createState() => _PickupServiceSelectionPageState();
}

class _PickupServiceSelectionPageState extends State<PickupServiceSelectionPage> {
  TextEditingController _stateController = TextEditingController();
  TextEditingController _licenseController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _stateController.dispose();
    _licenseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetConstants.MAPS),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _bottomModal(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomModal() {
    return Container(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _topRow(),
            SizedBox(height: 12.0),
            RoundedInputField(_stateController, "Select State", borderColor: Colors.black45),
            SizedBox(height: 12.0),
            RoundedInputField(_licenseController, "License Plate #", borderColor: Colors.black45),
            SizedBox(height: 12.0),
            Container(height: 1.0, color: Colors.black45, margin: EdgeInsets.symmetric(horizontal: 10.0)),
            SizedBox(height: 12.0),
            Bold18Black("Select Towing Type"),
            SizedBox(height: 24.0),
            _optionRow(),
            SizedBox(height: 20.0),
            _nextButton(),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Container _nextButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: RoundedCornerButton(
        "Next",
        _onNextButtonPressed,
        AppColors.orange,
        Colors.white,
      ),
    );
  }

  Widget _topRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Bold18Black("Car"),
          Image.asset(AssetConstants.BMW, height: 50.0),
          Bold18Black("X5"),
          ColoredCircle(color: Colors.black, size: 50.0),
        ],
      ),
    );
  }

  Widget _imageWithText(String imagePath, String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Bold16Black(text),
        Image.asset(imagePath, height: 50.0),
      ],
    );
  }

  Widget _optionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _imageWithText(AssetConstants.SUV, "FLATBED"),
        _imageWithText(AssetConstants.PICKUP, "PICKUP"),
        _imageWithText(AssetConstants.VAN, "HEAVY DUTY"),
      ],
    );
  }

  _onNextButtonPressed() {
    AppNavigator.changeScreen(BrandSelectionPage());
  }
}
