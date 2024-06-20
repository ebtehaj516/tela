import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widgets/custom_btn.dart';
import '../Widgets/Card.dart';

class FillEnglish extends StatefulWidget {
  const FillEnglish({super.key});

  @override
  State<FillEnglish> createState() => _FillEnglishState();
}

class _FillEnglishState extends State<FillEnglish> {
  final TextEditingController answerApple = TextEditingController();

  final TextEditingController answerOrange = TextEditingController();

  final TextEditingController answerBanana = TextEditingController();
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
                child: Text(
                  "Fill in the following blanks with the number of the correct answer",
                  style: CustomTextStyles.Merriweatherstyle40.copyWith(
                      fontWeight: FontWeight.bold),
                )),
            CardWidget(
              Answer: answerApple,
              imagePath: "assets/images/13.jpeg",
              choice1: "Apple",
              choice2: "Orange",
              choice3: "banana",
            ),
            CardWidget(
              Answer: answerOrange,
              imagePath: "assets/images/14.jpeg",
              choice1: "Apple",
              choice2: "Orange",
              choice3: "banana",
            ),
            CardWidget(
              Answer: answerBanana,
              imagePath: "assets/images/9.jpeg",
              choice1: "Apple",
              choice2: "Orange",
              choice3: "banana",
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 80, right: 80, bottom: 30, top: 10),
              child: CustomBtn(
                text: "OK",
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

                  //   if(answerApple.text==row[i]['Answer']){
                  //     print("hi");
                  // }
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
