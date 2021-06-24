import 'package:flutter/material.dart';
import 'package:haul_pra/constants/asset_constants.dart';
import 'package:haul_pra/helpers/helpers.dart';

import 'model_selection_page.dart';

class BrandSelectionPage extends StatelessWidget {
  const BrandSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _getAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 3,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              shrinkWrap: true,
              children: [
                _imageButton(AssetConstants.FIAT),
                _imageButton(AssetConstants.FORD),
                _imageButton(AssetConstants.BMW),
                _imageButton(AssetConstants.BMW),
                _imageButton(AssetConstants.FIAT),
                _imageButton(AssetConstants.FORD),
                _imageButton(AssetConstants.FIAT),
                _imageButton(AssetConstants.FORD),
                _imageButton(AssetConstants.BMW),
                _imageButton(AssetConstants.BMW),
                _imageButton(AssetConstants.FIAT),
                _imageButton(AssetConstants.FORD),
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
        "SELECT MAKE",
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

  Widget _imageButton(String imagePath) {
    return InkWell(
      onTap: () {
        AppNavigator.changeScreen(ModelSelectionPage());
      },
      child: Image.asset(imagePath, width: 46.0),
    );
  }
}
