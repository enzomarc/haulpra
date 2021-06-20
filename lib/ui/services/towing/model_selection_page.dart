import 'package:flutter/material.dart';
import 'package:haul_pra/constants/constants.dart';
import 'package:haul_pra/helpers/helpers.dart';
import 'package:haul_pra/ui/shared/shared.dart';

class ModelSelectionPage extends StatelessWidget {
  const ModelSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetConstants.MAPS),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      bottomSheet: _bottomModal(),
    );
  }

  Widget _bottomModal() {
    return Container(
      color: Colors.white,
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
            Bold18Black("SELECT MODEL"),
            SizedBox(height: 12.0),
            Image.asset(AssetConstants.BMW, height: 50.0),
            SizedBox(height: 12.0),
            _imageGrid(),
          ],
        ),
      ),
    );
  }

  Widget _imageGrid() {
    return GridView.count(
      crossAxisCount: 3,
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 6.0,
      childAspectRatio: 1.5,
      shrinkWrap: true,
      children: [
        _imageButton(AssetConstants.CAR),
        _imageButton(AssetConstants.VAN),
        _imageButton(AssetConstants.SUV),
        _imageButton(AssetConstants.PICKUP),
        _imageButton(AssetConstants.CAR),
        _imageButton(AssetConstants.VAN),
        _imageButton(AssetConstants.SUV),
        _imageButton(AssetConstants.PICKUP),
        _imageButton(AssetConstants.CAR),
        _imageButton(AssetConstants.VAN),
        _imageButton(AssetConstants.SUV),
        _imageButton(AssetConstants.PICKUP),
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
