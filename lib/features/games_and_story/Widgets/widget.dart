import 'package:flutter/cupertino.dart';
import '../../../core/Functions/functions.dart';
import '../game.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';

Widget fillinTheblanke(context,text,router)=>Padding(
  padding: const EdgeInsets.only(top: 8.0,bottom: 30,),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
          width:160,
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: AppColor.white,

          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 40),
            child: Image.asset("assets/images/image5.png",),
          )),
      Column(
        children: [
          Column(
            children: [
              Text("fill in ",style: CustomTextStyles.Merriweatherstyle40,),
              Container(
                margin: EdgeInsets.only(left: 25),
                width: 80,
                height:5,
                decoration: BoxDecoration(
                  color: AppColor.red,
                  borderRadius: BorderRadius.circular(50),
                ),
              )
            ],
          ),
          Text("the blank",style: CustomTextStyles.Merriweatherstyle40.copyWith(decoration: TextDecoration.none)),
          Text("$text",style: CustomTextStyles.Merriweatherstyle40.copyWith(decoration: TextDecoration.none))
        ],
      ),

    ],
  ),
);
Widget game1(image,text1,text2)=> Padding(
  padding: const EdgeInsets.only(top: 8.0,bottom: 30,),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Image.asset("assets/images/$image",width: 150,height: 150,),
      Column(
        children: [
          Column(
            children: [
              Text("$text1",style: CustomTextStyles.Merriweatherstyle40,),
              Container(
                width: 80,
                height:5,
                decoration: BoxDecoration(
                  color: AppColor.red,
                  borderRadius: BorderRadius.circular(50),
                ),
              )
            ],
          ),
          Text("$text2",style: CustomTextStyles.Merriweatherstyle40.copyWith(decoration: TextDecoration.none))
        ],
      ),

    ],
  ),
);


