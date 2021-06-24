import 'package:flutter/material.dart';
import 'package:haul_pra/constants/constants.dart';
import 'package:haul_pra/helpers/helpers.dart';
import 'package:haul_pra/ui/shared/shared.dart';

import 'pickup_service_selection_page.dart';

class ColorSelectionPage extends StatelessWidget {
  const ColorSelectionPage({Key? key}) : super(key: key);

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
            Medium24Black('1885'),
            Medium24Black('1884'),
            Medium24Black('1883'),
            Medium24Black('1882'),
            SizedBox(height: 12.0),
            OutlinedDivider(height: 3.0, margin: EdgeInsets.symmetric(horizontal: 10.0)),
            SizedBox(height: 8.0),
            _colorGrid(),
          ],
        ),
      ),
    );
  }

  Widget _colorGrid() {
    return GridView.count(
      crossAxisCount: 5,
      physics: NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12.0,
      crossAxisSpacing: 12.0,
      childAspectRatio: 1,
      shrinkWrap: true,
      children: [
        _coloredCircleButton(Colors.red),
        _coloredCircleButton(Colors.grey),
        _coloredCircleButton(Colors.white),
        _coloredCircleButton(Colors.green),
        _coloredCircleButton(Colors.black),
        _coloredCircleButton(Colors.blue),
        _coloredCircleButton(Colors.blueGrey),
        _coloredCircleButton(Colors.purple),
        _coloredCircleButton(Colors.indigo),
        _coloredCircleButton(Colors.lime),
      ],
    );
  }

  Widget _coloredCircleButton(Color color) {
    return InkWell(
      onTap: () {
        AppNavigator.changeScreen(PickupServiceSelectionPage());
      },
      child: ColoredCircle(color: color),
    );
  }
}
