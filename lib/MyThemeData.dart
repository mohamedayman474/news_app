import 'package:flutter/material.dart';

class MyThemeData{
  static var red=Color(0xffC91C22);
  static var blue=Color(0xff003E90);
  static var pink=Color(0xffED1E79);
  static var orange=Color(0xffCF7E48);
  static var lightBlue=Color(0xff4882CF);
  static var yellow=Color(0xffF2D352);
  static var labelColor=Color(0xff79828B);
  static var colorPrimary=Color.fromRGBO(57, 165, 82, 1.0);

   static ThemeData lightTheme=ThemeData(
  primaryColor: MyThemeData.colorPrimary,
     textTheme: TextTheme(
       headline5: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
       headline4: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)
     )
  );
}