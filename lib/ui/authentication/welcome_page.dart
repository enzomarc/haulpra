import 'package:flutter/material.dart';
import 'package:haul_pra/constants/constants.dart';
import 'package:haul_pra/ui/shared/shared.dart';

class WelcomePage extends StatelessWidget {
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        WelcomePageStructure(1, Strings.PAGE1, AssetConstants.PAGE1),
        WelcomePageStructure(2, Strings.PAGE2, AssetConstants.PAGE2),
        WelcomePageStructure(3, Strings.PAGE3, AssetConstants.PAGE3),
      ],
    );
  }
}
