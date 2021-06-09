import 'package:flutter/material.dart';
import 'package:haul_pra/constants/constants.dart';
import 'package:haul_pra/ui/shared/shared.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SafeArea(
        child: Center(
          child: Row(
            children: [
              Logo(),
              Regular32White(Strings.HAUL),
              Bold32White(Strings.PRA),
            ],
          ),
        ),
      ),
    );
  }
}
