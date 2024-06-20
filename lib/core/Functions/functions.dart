import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/app_text_style.dart';

//function return Title of app
Widget titleOfApp(bottom) => Padding(
      padding: EdgeInsets.only(
        bottom: bottom,
      ),
      child: Text(
        "Tela" + " تـــيله",
        style: CustomTextStyles.Merriweather100style90,
      ),
    );
//function to push path
void customNavigate(context, String path) {
  GoRouter.of(context).push(path);
}

//function to pushReplacement path
void customReplacementNavigate(context, String path) {
  GoRouter.of(context).pushReplacement(path);
}

//function to pushNamed path
void customNavigateNamed(context, String path, String title) {
  Navigator.of(context).pushNamed(path);
}

//function to pop
void customRemoveNavigate(context) {
  GoRouter.of(context).pop();
}
