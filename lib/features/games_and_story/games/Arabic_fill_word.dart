import 'package:flutter/material.dart';
import 'package:tela/core/utils/app_colors.dart';
import 'package:tela/core/utils/app_text_style.dart';
import '../../../core/widgets/custom_btn.dart';
import '../Widgets/Card.dart';

class FillArabic extends StatefulWidget {
  const FillArabic({
    super.key,
  });

  @override
  State<FillArabic> createState() => _FillArabicState();
}

class _FillArabicState extends State<FillArabic> {
  final TextEditingController answerApple = TextEditingController();
  final TextEditingController answerOrange = TextEditingController();
  final TextEditingController answerBanana = TextEditingController();

  // final List<Map> Fruit = [
  //   {'id': '1', 'image': 'assets/images/13.jpeg', 'Answer': 'تــــفاحة'},
  //   {'id': '2', 'image': 'assets/images/13.jpeg', 'Answer': 'بــــرتقالة'},
  //   {'id': '3', 'image': 'assets/images/13.jpeg', 'Answer': 'مــــوزة'},
  // ];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int score = 0;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.yellow.withOpacity(0.9),
      //
      body: Container(
          child: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 40, bottom: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.white),
                child: Text(
                    " أمـــلى الفــراغات التــالية بــرقم الاجــابة المــناسب  ",
                    style: CustomTextStyles.Merriweatherstyle40.copyWith(
                        fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl)),
            CardWidget(
              Answer: answerApple,
              imagePath: "assets/images/13.jpeg",
            ),
            CardWidget(
              Answer: answerOrange,
              imagePath: "assets/images/14.jpeg",
            ),
            CardWidget(
              Answer: answerBanana,
              imagePath: "assets/images/9.jpeg",
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 80, right: 80, bottom: 30, top: 10),
              child: CustomBtn(
                text: "مـــــوافق",
                onPressed: () {
                  if (answerApple.text == "3") {
                    score += 5;
                  }
                  if (answerOrange.text == "2") {
                    score += 5;
                  }
                  if (answerBanana.text == "1") {
                    score += 5;
                  }
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pop(score);
                  }
                },
                height: 60,
              ),
            ),
          ],
        ),
      )),
    ));
  }
}
