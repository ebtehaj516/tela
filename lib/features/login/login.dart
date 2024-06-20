import 'package:flutter/material.dart';
import 'package:tela/core/database/sql.dart';
import 'package:tela/core/services/service_locator.dart';
import 'package:tela/core/utils/app_colors.dart';
import '../../core/Functions/functions.dart';
import '../../core/database/cash/cache_helper.dart';
import '../../core/utils/app_text_style.dart';
import '../../core/widgets/backgrond.dart';
import '../../core/widgets/custom_btn.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../core/widgets/have_acount.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool? check=false;
  bool isLoginTrue=false;
  final TextEditingController userName=TextEditingController();
  final TextEditingController password=TextEditingController();
  Sql sql=Sql();
  login()async{
    var response=await sql.login(userName.text,password.text,);
    if(response == true){
      getIt<CacheHelper>().saveData(key: "login", value: sql.userId);
      getIt<CacheHelper>().saveData(key: "loginTypeUser", value: sql.userType);
     // getIt<CacheHelper>().saveData(key: "scoreUser", value: sql.score);
      customReplacementNavigate(context,'/HomePage');
    }else{
       setState(() {
        isLoginTrue=true;
      });
    }
  }
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Background(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 49,vertical: 60),
          child: ListView(
            children: [
              Center(child: titleOfApp(54.0)),
              Padding(
                padding: const EdgeInsets.only(bottom: 2,right: 63,left: 63),
                child: Form(
                  key:_formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        textHint: "User Name",
                        nameField: userName,
                      ),
                      CustomTextField(
                        textHint: "Password",
                        field: true,
                        nameField: password,
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 53,left: 99,bottom: 43,right: 60),
                child: CustomBtn(text: "Log in",onPressed: (){
                  if(_formKey.currentState!.validate()){
                    login();
                  }
                },),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 99,bottom: 16,),
                child: Row(
                  children: [
                    Checkbox(value: check, onChanged: (bool? value){
                      setState(() {
                        check=value;
                        print(check);
                      });

                    },
                      activeColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)
                      ),

                    ),
                    Text("remember me?",style: CustomTextStyles.Merriweatherstyle15.copyWith(color: AppColor.dBlack),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 31,bottom: 107,right: 17),
                child: HaveAnAccount(text1: "Not yet registered? ", text2: "Sign up ", text3: "now",onTap: (){
                  customNavigate(context,'/Personality');
                 // customNavigate(context,'/Signup');
                },),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 149,right: 71),
                child: Text("Need help?",style: CustomTextStyles.Merriweather100style90.copyWith(fontSize: 15),),
              ),
              if(isLoginTrue)
               Padding(
                 padding: const EdgeInsets.only(top: 15),
                   child: Text(
                    "The user name or password is not valid",
                    style: CustomTextStyles.Merriweatherstyle15.copyWith(
                        color: AppColor.red, fontSize: 14),
                  )),
          ],
          ),
        ),
      );

  }
}
