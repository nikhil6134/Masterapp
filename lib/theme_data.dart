import 'package:flutter/foundation.dart';

import 'constants.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: kbackgroundcolor,
      appBarTheme: appBarTheme(),
      accentColor: kPrimarycolor,
      textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder()
      }));
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
  );
  return InputDecorationTheme(
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    disabledBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    border: InputBorder.none,

    //enabledBorder: outlineInputBorder,
    //focusedBorder: outlineInputBorder,
    //border: outlineInputBorder
  );
}

TextTheme textTheme() {
  return TextTheme(
      bodyText1: TextStyle(
        color: ktextsecondarycolor,
      ),
      bodyText2: TextStyle(color: kboldtextcolor));
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: kPrimarycolor,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      textTheme: TextTheme(
          headline6: TextStyle(
        color: Colors.white,
        fontSize: 18,
      )));
}
