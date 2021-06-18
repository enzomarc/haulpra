import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:haul_pra/constants/asset_constants.dart';
import 'package:haul_pra/ui/shared/shared.dart';

class ServiceSelectionPage extends StatefulWidget {
  const ServiceSelectionPage({Key? key}) : super(key: key);

  @override
  _ServiceSelectionPageState createState() => _ServiceSelectionPageState();
}

class _ServiceSelectionPageState extends State<ServiceSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetConstants.MAPS),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipPath(
                  clipper: CustomBottomRoundedShape(),
                  child: Container(
                    width: double.infinity,
                    height: 75,
                    color: Colors.black,
                    child: Align(
                      alignment: Alignment.center,
                      child: Bold18White("SERVICE"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                  child: _getServices(),
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
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: Icon(FontAwesomeIcons.bars),
        onPressed: (){},
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.phone_in_talk_rounded, color: Colors.white),
          onPressed: (){},
        ),
      ],
    );
  }
  
  Widget _getServices() {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 24.0,
      children: [
        IconButtonWithText(
          "TOWING",
          true,
          _onServiceTap,
          FontAwesomeIcons.truckLoading,
        )
        ,IconButtonWithText(
          "TRANSPORT",
          true,
          _onServiceTap,
          FontAwesomeIcons.busAlt,
        )
        ,IconButtonWithText(
          "FLAT TIER",
          true,
          _onServiceTap,
          FontAwesomeIcons.truckMonster,
        )
        ,IconButtonWithText(
          "GAS",
          true,
          _onServiceTap,
          FontAwesomeIcons.gasPump,
        )
        ,IconButtonWithText(
          "LOCKOUT",
          true,
          _onServiceTap,
          FontAwesomeIcons.server,
        )
        ,IconButtonWithText(
          "JUMP START",
          true,
          _onServiceTap,
          FontAwesomeIcons.chargingStation,
        )
        ,IconButtonWithText(
          "CAR WASH",
          true,
          _onServiceTap,
          FontAwesomeIcons.carCrash,
        )
        ,IconButtonWithText(
          "OIL CHANGE",
          true,
          _onServiceTap,
          FontAwesomeIcons.oilCan,
        ),
      ],
    );
  }

  _onServiceTap() {
    print("Tap");
  }
}
