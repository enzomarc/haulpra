import 'package:flutter/material.dart';
import 'package:haul_pra/constants/constants.dart';
import 'package:haul_pra/helpers/helpers.dart';
import 'package:haul_pra/ui/services/services.dart';
import 'package:haul_pra/ui/shared/shared.dart';

import '../towing/brand_selection_page.dart';

class TireHomePage extends StatefulWidget {
  const TireHomePage({Key? key}) : super(key: key);

  @override
  _TireHomePageState createState() => _TireHomePageState();
}

class _TireHomePageState extends State<TireHomePage> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _topRow(),
              SizedBox(height: 12.0),
              _searchField(),
              SizedBox(height: 12.0),
              _addressText(),
              SizedBox(height: 20.0),
              Container(height: 1.0, color: Colors.white, margin: EdgeInsets.symmetric(horizontal: 30.0),),
              SizedBox(height: 20.0),
              _carRow(),
              SizedBox(height: 20.0),
              OutlinedDivider(),
              SizedBox(height: 20.0),
              _nextButton(),
              SizedBox(height: 20.0),
            ],
          ),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Bold18Black("My Location"),
          Image.asset(AssetConstants.TIRE, height: 40.0),
        ],
      ),
    );
  }

  RichText _addressText() {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(Icons.location_on, color: Colors.black),
          ),
          TextSpan(
            text: " 7658 Peter st Hollywood fl 33678",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchField() {
    return TextField(
      style: TextStyle(color: Colors.black),
      controller: _searchController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black45, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black45, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black45, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
        ),
        hintText: "Search Location",
        hintStyle: TextStyle(color: Colors.grey),
        suffixIcon: Icon(Icons.location_on, color: Colors.black),
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

  Widget _carRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _imageWithText(AssetConstants.CAR, "CAR BMW X5"),
        RoundedCornerButton("Update", (){
          AppNavigator.changeScreen(TowingServiceHomePage());
        }, Colors.black, Colors.white),
      ],
    );
  }

  _showPickupOptionsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Bold18Black('Select Option', textAlign: TextAlign.center),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => AppNavigator.replaceScreen(ServiceProviderSelectionPage()),
              child: _imageWithText(AssetConstants.SUV, "FLATBED"),
            ),
            InkWell(
              onTap: () => AppNavigator.replaceScreen(ServiceProviderSelectionPage()),
              child: _imageWithText(AssetConstants.PICKUP, "PICKUP"),
            ),
            InkWell(
              onTap: () => AppNavigator.replaceScreen(ServiceProviderSelectionPage()),
              child: _imageWithText(AssetConstants.VAN, "HEAVY DUTY"),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        backgroundColor: Colors.grey[200],
        // backgroundColor: Color(0x60000000),
      ),
    );
  }

  _onNextButtonPressed() {
    _showPickupOptionsDialog();
  }
}
