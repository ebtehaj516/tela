import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tela/core/utils/app_colors.dart';

import '../utils/app_text_style.dart';
//create class Button
class CustomBtn extends StatelessWidget {
  const CustomBtn(
      {super.key,
      this.color,
      required this.text,
      this.onPressed,
      this.height,
      this.width,
      this.style});

  final Color? color;
  final String text;
  final TextStyle? style;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return customButton(Text(
      text,
      style: style != null ? style : CustomTextStyles.Interstyle25,
    ));
  }

  //is button for work onPressed
  Widget customButton(child) => SizedBox(
        width: width == null ? 235 : width,
        height: height == null ? 45 : height,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                backgroundColor: color ?? AppColor.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28))),
            child: child),
      );
}
