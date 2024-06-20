import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tela/core/utils/app_colors.dart';

//class for style in the font app
abstract class CustomTextStyles{
  //static  const TextAlign textAlign =TextAlign.center;
 static const Merriweather100style90= TextStyle(
 fontSize: 40,
 color: AppColor.lightBlack,
 fontFamily: "MerriweatherBlack",

     );
 static const  MerriweatherBlackstyle24= TextStyle(
  fontSize: 14,
  color: AppColor.dBlack,
  fontFamily: "MerriweatherBlack",

 );
 static const  Merriweatherstyle40= TextStyle(
  fontSize: 20,
  color: AppColor.dBlack,
  fontFamily: "Merriweather",

 );

 static const  Merriweatherstyle24= TextStyle(
  fontSize: 14,
  color: AppColor.dBlack,
  fontFamily: "Merriweather",

 );
 static const  Merriweatherstyle15= TextStyle(
  fontSize: 15,
  color: AppColor.darkGray,
  fontFamily: "Merriweather",

 );
 static const Interstyle25= TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  color: AppColor.black,
  fontFamily: "Inter",

 );
 static const Interstyle30= TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: AppColor.lightBlack,
  fontFamily: "Inter",

 );

}