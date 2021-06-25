import 'package:flutter/material.dart';
import 'package:haul_pra/constants/constants.dart';
import 'package:haul_pra/helpers/helpers.dart';
import 'package:haul_pra/ui/shared/shared.dart';

import 'brand_selection_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
        padding: EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Medium14Gray('      Drop off location'),
            SizedBox(height: 6.0),
            _addressText('2515 New Jersey, Park Street, NY'),
            SizedBox(height: 12.0),
            Medium14Gray('      Pick up location'),
            SizedBox(height: 6.0),
            _addressText('2433 New Eskaton, Sumana Street, NY'),
            SizedBox(height: 12.0),
            _divider(),
            SizedBox(height: 8.0),
            _modelRow(),
            SizedBox(height: 8.0),
            _divider(),
            SizedBox(height: 12.0),
            _paymentWidget(),
            SizedBox(height: 8.0),
            _divider(),
            SizedBox(height: 16.0),
            _payButton(),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _paymentWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedCornerButton("ADD", (){}, AppColors.blue, Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
              fontSize: 16.0,
            ),
            Bold16Black("XX95"),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AssetConstants.VISA, height: 20.0),
                Image.asset(AssetConstants.MASTERCARD, height: 20.0),
                Image.asset(AssetConstants.DISCOVER, height: 20.0),
              ],
            ),
          ],
        ),
        Bold16Black("Price : \$64.36"),
        Bold16Black("Service Fee : \$3.50"),
        Bold16Black("Total : \$68.06"),
        Bold16Green('ETA 17 min/2.09 mile'),
        SizedBox(height: 6.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedCornerButton("Apply", (){}, AppColors.blue, Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
              fontSize: 16.0,
            ),
            RoundedCornerButton("PROMO CODE", (){}, Colors.white, Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 6.0),
              fontSize: 16.0,
            ),
          ],
        ),
      ],
    );
  }

  Widget _modelRow() {
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
          Image.asset(AssetConstants.CAR, height: 60.0),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      height: 1.0,
      color: Colors.black12,
      margin: EdgeInsets.symmetric(horizontal: 30.0),
    );
  }

  Container _payButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: RoundedCornerButton(
        "Pay Now",
        _onNextButtonPressed,
        AppColors.orange,
        Colors.white,
      ),
    );
  }

  RichText _addressText(String address) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(Icons.location_on, color: Colors.black),
          ),
          TextSpan(
            text: " $address",
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
        _imageWithText(AssetConstants.CAR, "CAR"),
        _imageWithText(AssetConstants.SUV, "SUV"),
        _imageWithText(AssetConstants.PICKUP, "PICKUP"),
        _imageWithText(AssetConstants.VAN, "VAN"),
      ],
    );
  }

  _onNextButtonPressed() {
    AppNavigator.changeScreen(BrandSelectionPage());
  }
}
