import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

//create haveAnAccount text
class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount(
      {super.key,
      required this.text1,
      required this.text2,
      this.onTap,
      required this.text3});

  final String text1, text2, text3;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text.rich(TextSpan(children: [
        TextSpan(
          text: text1,
          style: CustomTextStyles.Merriweatherstyle15.copyWith(
              color: AppColor.dBlack),
        ),
        TextSpan(
            text: text2,
            style: CustomTextStyles.Merriweatherstyle15.copyWith(
                color: AppColor.dBlack, fontWeight: FontWeight.bold)),
        TextSpan(
          text: text3,
          style: CustomTextStyles.Merriweatherstyle15.copyWith(
              color: AppColor.dBlack),
        ),
      ])),
    );
  }
}
