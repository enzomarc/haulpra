import 'package:flutter/material.dart';
import 'package:haul_pra/constants/constants.dart';
import 'package:haul_pra/helpers/helpers.dart';
import 'package:haul_pra/ui/services/services.dart';
import 'package:haul_pra/ui/shared/shared.dart';

class TireReplacementPage extends StatefulWidget {
  const TireReplacementPage({Key? key}) : super(key: key);

  @override
  _TireReplacementPageState createState() => _TireReplacementPageState();
}

class _TireReplacementPageState extends State<TireReplacementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: _getAppBar(),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipPath(
                  clipper: CustomBottomRoundedShape(),
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(AssetConstants.TIRE, height: 32.0),
                            SizedBox(width: 6.0),
                            Bold18White("New"),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(AssetConstants.TIRE, height: 32.0),
                            SizedBox(width: 6.0),
                            Bold18White("Use"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                  child: _getBody(),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.blue,
      title: Bold18White("Tire Replacement"),
    );
  }

  Widget _getBody() {
    return Column(
      children: [
        Image.asset(AssetConstants.TIRE_REPLACEMENT),
        SizedBox(height: 20.0),
        _nextButton(),
      ],
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

  _onNextButtonPressed() {
    AppNavigator.changeScreen(PaymentPage());
  }
}
