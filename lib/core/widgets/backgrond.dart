import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tela/core/utils/app_colors.dart';

//class for background some pages
class Background extends StatelessWidget {
  const Background({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:(Platform.isIOS)?CupertinoPageScaffold(child: containerForHome(child)):Scaffold(
        //container takes width  and height of interface
        body: containerForHome(child),
      ),
    );
  }
}
Widget containerForHome(child)=>Container(
  decoration: const BoxDecoration(
    color: AppColor.cyan1,
    image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/images/background.png")),
  ),
  width: double.infinity,
  height: double.infinity,
  child: Container(
    color: (Platform.isIOS)?AppColor.lightBlue.withOpacity(0.1):Colors.blue.withOpacity(0.1),
    child: child,
  ),
);