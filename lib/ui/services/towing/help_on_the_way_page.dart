import 'package:flutter/material.dart';
import 'package:haul_pra/constants/constants.dart';
import 'package:haul_pra/helpers/helpers.dart';
import 'package:haul_pra/ui/shared/shared.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'brand_selection_page.dart';

class HelpOnTheWayPage extends StatefulWidget {
  const HelpOnTheWayPage({Key? key}) : super(key: key);

  @override
  _HelpOnTheWayPageState createState() => _HelpOnTheWayPageState();
}

class _HelpOnTheWayPageState extends State<HelpOnTheWayPage> {
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
                    Bold16Green('Price: \$30.06'),
                  ],
                ),
                _imageRowWithRating(),
              ],
            ),
            SizedBox(height: 16.0),
            _cancelButton(),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Column _imageRowWithRating() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          child: Icon(Icons.person, color: Colors.white, size: 90.0),
          radius: 50.0,
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
      width: 1.0,
      color: Colors.black12,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
    );
  }

  Container _cancelButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: RoundedCornerButton(
        "Cancel",
        _onCancelButtonPressed,
        Colors.black,
        Colors.white,
      ),
    );
  }

  _onCancelButtonPressed() {
    AppNavigator.changeScreen(BrandSelectionPage());
  }
}
