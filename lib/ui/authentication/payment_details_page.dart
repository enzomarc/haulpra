import 'package:flutter/material.dart';
import 'package:haul_pra/constants/asset_constants.dart';
import 'package:haul_pra/constants/constants.dart';
import 'package:haul_pra/helpers/helpers.dart';
import 'package:haul_pra/ui/shared/shared.dart';

class PaymentDetailsPage extends StatefulWidget {
  const PaymentDetailsPage({Key? key}) : super(key: key);

  @override
  _PaymentDetailsPageState createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  String? _radioSelectedText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _grayContainer(36.0),
            _paypalCard(),
            _grayContainer(10.0),
            _cardRadioTile(AssetConstants.MASTERCARD, 'XXXXXXXXXXXX0987'),
            _grayContainer(1.0),
            _cardRadioTile(AssetConstants.VISA, 'XXXXXXXXXXXX0234'),
            _grayContainer(1.0),
            _cardRadioTile(AssetConstants.DISCOVER, 'XXXXXXXXXXXX0197'),
            _grayContainer(1.0),
            Spacer(flex: 2),
            _paymentButtons(),
            Spacer(flex: 1),
            _getSkipButton(),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () => AppNavigator.popScreen(),
      ),
      title: Text(
        "PAYMENT DETAILS",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.phone_in_talk_rounded, color: Colors.black),
          onPressed: (){},
        ),
      ],
    );
  }

  Widget _grayContainer(double height) {
    return Container(
      height: height,
      width: double.infinity,
      color: Colors.grey[300],
    );
  }

  Widget _paypalCard() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AssetConstants.PAYPAL, width: 64.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Bold16Black("Price : \$64.36"),
              Bold16Black("Service Fee : \$3.50"),
              Bold16Black("Total : \$68.06"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardRadioTile(String imagePath, String cardNumber) {
    return RadioListTile<String>(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(imagePath, width: 30.0),
          Regular16Black(cardNumber),
          IconButton(icon: Icon(Icons.delete, color: Colors.grey), onPressed: (){}),
        ],
      ),
      value: cardNumber,
      groupValue: _radioSelectedText,
      onChanged: (String? value) {
        setState(() {
          _radioSelectedText = value;
        });
      },
      activeColor: Colors.blueAccent,
      selectedTileColor: Colors.grey,
    );
  }

  Widget _paymentButtons() {
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RectangleButton("PAY", (){}, Colors.blueAccent, Colors.white),
          SizedBox(height: 10.0),
          RectangleButton("ADD PAYMENT METHOD", (){}, Colors.blueAccent, Colors.white)
        ],
      ),
    );
  }

  RoundedCornerButton _getSkipButton() {
    return RoundedCornerButton(
      'Skip',
      _onSkipButtonPressed,
      AppColors.orange,
      Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 64.0, vertical: 10.0),
    );
  }

  _onSkipButtonPressed() {

  }
}
