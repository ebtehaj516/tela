import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widgets/custom_btn.dart';
import '../../../core/widgets/custom_text_field.dart';

class MathPage extends StatefulWidget {
  const MathPage({super.key});

  @override
  State<MathPage> createState() => _MathPageState();
}

class _MathPageState extends State<MathPage> {
  final TextEditingController answer1 = TextEditingController();
  final TextEditingController answer2 = TextEditingController();
  final TextEditingController answer3 = TextEditingController();
  final TextEditingController answer4 = TextEditingController();
  final TextEditingController answer5 = TextEditingController();
  final TextEditingController answer6 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int score = 0;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.yellow.withOpacity(0.9),
      body: Container(
          child: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
                alignment: Alignment.center,
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.white),
                child: Text(" قـــم بـــحل هـــذه العـــمليات الحــــاسبية ",
                    style: CustomTextStyles.Merriweatherstyle40.copyWith(
                        fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl)),
            cardMath(answer1, " 3  +  1  =   -------"),
            cardMath(answer2, " 6  *  6  =   -------"),
            cardMath(answer3, " 10  -  2  =   -------"),
            cardMath(answer4, " 10  /  2  =   -------"),
            cardMath(answer5, " 8  *  2  =   -------"),
            cardMath(answer6, " 10  +  4  =   -------"),
            Padding(
              padding: const EdgeInsets.only(
                  left: 80, right: 80, bottom: 30, top: 10),
              child: CustomBtn(
                text: "مـــــوافق",
                onPressed: () {
                  if (answer1.text == "4") {
                    score += 10;
                  }
                  if (answer2.text == "36") {
                    score += 10;
                  }
                  if (answer3.text == "8") {
                    score += 10;
                  }
                  if (answer4.text == "5") {
                    score += 10;
                  }
                  if (answer5.text == "16") {
                    score += 10;
                  }
                  if (answer6.text == "14") {
                    score += 10;
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

  Widget cardMath(final TextEditingController Answer, String question) =>
      Container(
        margin: EdgeInsets.only(bottom: 5, top: 30, left: 40, right: 40),
        width: 150,
        height: 170,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: AppColor.white),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Center(
                  child: Text(question,
                      style: CustomTextStyles.Merriweatherstyle40.copyWith(
                          fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 80, bottom: 30),
              child: CustomTextField(
                textHint: "الاجـــــــابة",
                nameField: Answer,
                direction: true,
                style: true,
              ),
            )
          ],
        ),
      );
}
