import 'package:flutter/material.dart';

import 'constants/constants.dart';
import 'data/global_storage/global_storage.dart';
import 'ui/authentication/authentication.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    GlobalStorage.navigatorKey = GlobalKey<NavigatorState>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.APP_NAME,
      debugShowCheckedModeBanner: false,
      navigatorKey: GlobalStorage.navigatorKey,
      theme: _getThemeData(),
      home: SplashPage(),
    );
  }

  ThemeData _getThemeData() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blueGrey,
      accentColor: Colors.blueGrey,
      backgroundColor: AppColors.appPrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: Strings.FONT_FAMILY,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(Numbers.buttonPadding),
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.orange),
          shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(Numbers.buttonRounding))),
          elevation: MaterialStateProperty.all<double>(Numbers.buttonElevation),
        ),
      ),
      // inputDecorationTheme: InputDecorationTheme(
      //   filled: true,
      //   fillColor: AppColors.darkPrimaryColor,
      //   contentPadding: NumberConstants.inputPadding,
      //   enabledBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(NumberConstants.inputRounding)),
      //     borderSide: BorderSide.none,
      //   ),
      //   disabledBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(NumberConstants.inputRounding)),
      //     borderSide: BorderSide.none,
      //   ),
      //   border: OutlineInputBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(NumberConstants.inputRounding)),
      //     borderSide: BorderSide.none,
      //   ),
      // ),
      textTheme: TextTheme(),
    );
  }
}