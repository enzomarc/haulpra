import 'package:flutter/material.dart';
import 'package:haul_pra/constants/constants.dart';
import 'package:haul_pra/helpers/helpers.dart';
import 'package:haul_pra/ui/services/services.dart';
import 'package:haul_pra/ui/shared/shared.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RequestAcceptedPage extends StatefulWidget {
  const RequestAcceptedPage({Key? key}) : super(key: key);

  @override
  _RequestAcceptedPageState createState() => _RequestAcceptedPageState();
}

class _RequestAcceptedPageState extends State<RequestAcceptedPage> {
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
            Positioned(
              top: 50.0,
              right: 10.0,
              child: Bold22Black('2587'),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Bold16Green('ETA 17 min/2.09 miles'),
                    SizedBox(height: 10.0),
                    _details(),
                    SizedBox(height: 10.0),
                    Bold16Green('Price: \$30.06'),
                  ],
                ),
                _imageRowWithRating(),
              ],
            ),
            SizedBox(height: 16.0),
            _buttonRow(),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Row _details() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Bold16Black("Company"),
            Bold16Black("Type"),
            Bold16Black("Color"),
            Bold16Black("Make"),
          ],
        ),
        _divider(),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Bold16Black("Sam Towing"),
            Bold16Black("Flatbed"),
            Bold16Black("Red"),
            Bold16Black("Ford"),
          ],
        ),
      ],
    );
  }

  Column _imageRowWithRating() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          child: Icon(Icons.person, color: Colors.white, size: 80.0),
          radius: 40.0,
          backgroundColor: Colors.grey,
        ),
        Bold16Black("Peter"),
        RatingBar.builder(
          allowHalfRating: true,
          initialRating: 4.5,
          itemSize: 22.0,
          ignoreGestures: true,
          unratedColor: Colors.grey[300],
          itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
          itemBuilder: (context, _) => Icon(Icons.star, color: Colors.orange),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        SizedBox(height: 16.0),
        Image.asset(AssetConstants.PICKUP, height: 50.0),
      ],
    );
  }

  Widget _divider() {
    return Container(
      width: 1.5,
      height: 90.0,
      color: Colors.black12,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
    );
  }

  Widget _buttonRow() {
    return ThreeButtonRow(
      firstButtonColor: Colors.black,
      secondButtonColor: Colors.green,
      thirdButtonColor: AppColors.orange,
      firstButtonText: 'Cancel',
      secondButtonText: 'Call',
      thirdButtonText: 'Message',
      firstButtonCallback: _navigateToServiceArrivedPage,
      secondButtonCallback: _navigateToServiceArrivedPage,
      thirdButtonCallback: _navigateToServiceArrivedPage,
    );
  }

  _navigateToServiceArrivedPage() {
    AppNavigator.changeScreen(ServiceArrivedPage());
  }
}
