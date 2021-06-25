import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:haul_pra/helpers/helpers.dart';
import 'package:haul_pra/ui/services/towing/payment_page.dart';
import 'package:haul_pra/ui/shared/shared.dart';

class ServiceProviderSelectionPage extends StatelessWidget {
  const ServiceProviderSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: _getAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                _serviceProviderTile("DEXTER", "ETA 17 min/2.09 miles", "\$100.00", 1.5),
                SizedBox(height: 12.0),
                _serviceProviderTile("STATE TOWING", "ETA 17 min/2.09 miles", "\$50.00", 3.0),
                SizedBox(height: 12.0),
                _serviceProviderTile("A DRIVER", "ETA 17 min/2.09 miles", "\$6.27", 4.5),
                SizedBox(height: 12.0),
                _serviceProviderTile("HILL MAN", "ETA 17 min/2.09 miles", "\$20.09", 3.5),
                SizedBox(height: 12.0),
              ],
            ),
          ),
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
        "SERVICE PROVIDER LIST",
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

  Widget _serviceProviderTile(String title, String subTitle, String price, double rating) {
    return InkWell(
      onTap: () => AppNavigator.changeScreen(PaymentPage()),
      child: ListTile(
        tileColor: Colors.white,
        title: _getTitle(title, rating),
        subtitle: Medium14Green(subTitle),
        leading: _circularPriceWidget(price),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54),
      ),
    );
  }

  Widget _getTitle(String title, double rating) {
    return Row(
      children: [
        Bold15Grey(title),
        SizedBox(width: 8.0),
        RatingBar.builder(
          allowHalfRating: true,
          initialRating: rating,
          itemSize: 18.0,
          ignoreGestures: true,
          unratedColor: Colors.grey[300],
          itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
          itemBuilder: (context, _) => Icon(Icons.star, color: Colors.yellow),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
      ],
    );
  }

  Widget _circularPriceWidget(String price) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.all(Radius.circular(40.0)),
      ),
      child: Center(child: Medium12White(price)),
    );
  }
}
