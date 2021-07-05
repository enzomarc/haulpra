import 'package:flutter/material.dart';
import 'package:haul_pra/constants/constants.dart';
import 'package:haul_pra/ui/services/service_selection_page.dart';
import 'package:haul_pra/ui/shared/shared.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CompleteJobPage extends StatefulWidget {
  const CompleteJobPage({Key? key}) : super(key: key);

  @override
  _CompleteJobPageState createState() => _CompleteJobPageState();
}

class _CompleteJobPageState extends State<CompleteJobPage> {
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
            _completeJobButton(),
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

  Widget _completeJobButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: RoundedCornerButton(
        "COMPLETE JOB",
        _showConfirmationDialog,
        Colors.green,
        Colors.white,
      ),
    );
  }

  _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Bold18White('Message!', textAlign: TextAlign.center),
        content: Bold18White('Are you sure you want to complete the job? Please make sure you are at the drop off location.'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        backgroundColor: Color(0x60000000),
        // actionsPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 12.0),
        actions: [
          RoundedCornerButton('YES', _onYesPressed, Colors.green, Colors.white),
          RoundedCornerButton('NO', _onNoPressed, Colors.red, Colors.white),
        ],
      ),
    );
  }

  _onYesPressed() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => ServiceSelectionPage())
    );
  }

  _onNoPressed() {
    Navigator.of(context).pop();
  }
}
