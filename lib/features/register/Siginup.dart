import 'package:flutter/material.dart';
import 'package:tela/core/database/sql.dart';
import 'package:tela/core/utils/app_colors.dart';
import 'package:tela/core/utils/app_text_style.dart';
import '../../core/Functions/functions.dart';
import '../../core/database/cash/cache_helper.dart';
import '../../core/services/service_locator.dart';
import '../../core/widgets/custom_btn.dart';
import '../../core/widgets/custom_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key, required this.clothes});

  final List clothes;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isInsertedTrue = false;
  var userType = getIt<CacheHelper>().getData(key: "userType");

  readUserId() async {
    var response = await sql.readUserId(
      firstName.text,
      lastName.text,
    );
    if (response == true) {
      print(sql.userIdInserted);
    } else {
      return 0;
    }
  }

  readToInsert() async {
    var response = await sql.readUserId(
      firstName.text,
      lastName.text,
    );
    if (response == true) {
      setState(() {
        isInsertedTrue = true;
      });
    } else {
      customNavigate(context, '/');
    }
  }

  Sql sql = Sql();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController rePassword = TextEditingController();
  final TextEditingController number = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int count = 0;
    return Scaffold(
      backgroundColor: AppColor.white3,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: ListView(
          children: [
            Center(child: titleOfApp(29.0)),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 2,
                right: 60,
                left: 120,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      textHint: "First Name",
                      nameField: firstName,
                    ),
                    CustomTextField(
                      textHint: "Last Name",
                      nameField: lastName,
                    ),
                    CustomTextField(
                      textHint: "password",
                      field: true,
                      nameField: password,
                    ),
                    CustomTextField(
                      textHint: "Re Enter Password",
                      nameField: rePassword,
                      field: true,
                      pass1: password,
                      pass2: rePassword,
                    ),
                    CustomTextField(
                      textHint: "Number",
                      nameField: number,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 37, left: 145, right: 80, bottom: 101),
              child: CustomBtn(
                text: "Register",
                width: 279,
                height: 70,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    readToInsert();
                    if (isInsertedTrue == false) {
                      final result1 = sql.insertData(
                          'INSERT INTO UserInformation(first_name,last_name,Password,Number,type_user,score) VALUES("${firstName.text}", "${lastName.text}", "${password.text}","${number.text}","$userType","${0}")');
                      readUserId();

                      for (int i = 0; i < widget.clothes.length; i++) {
                        print(widget.clothes[i]);
                        var result2 = sql.insertData(
                            'INSERT INTO Clothes(image_clothes,user_id) VALUES("${widget.clothes[i]}", "${sql.userIdInserted}")');
                        count++;
                      }
                      if (result1 != null && count > 0) {
                        print("Inserted data");
                      } else {
                        print("no inserted ");
                      }
                    }
                  }
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 154,
              ),
              child: Row(
                children: [
                  Text("Contact us ",
                      style: CustomTextStyles.MerriweatherBlackstyle24),
                  Text("for more", style: CustomTextStyles.Merriweatherstyle24),
                ],
              ),
            ),
            if (isInsertedTrue)
              Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 40,
                  ),
                  child: Text(
                    "The FirstName and LastName is Founded",
                    style: CustomTextStyles.Merriweatherstyle15.copyWith(
                        color: AppColor.red, fontSize: 14),
                  )),
          ],
        ),
      ),
    );
  }
}
