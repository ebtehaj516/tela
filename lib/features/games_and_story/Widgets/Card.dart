import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widgets/custom_text_field.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key,required this.Answer, required this.imagePath, this.choice1, this.choice2, this.choice3});
  final TextEditingController Answer;
final String imagePath;
final String? choice1;
  final String? choice2;
  final String? choice3;
  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  // final List<Map> Fruit = [
  //   {'id': '1', 'image': 'assets/images/13.jpeg', 'Answer': 'تــــفاحة'},
  //   {'id': '2', 'image': 'assets/images/13.jpeg', 'Answer': 'بــــرتقالة'},
  //   {'id': '3', 'image': 'assets/images/13.jpeg', 'Answer': 'مــــوزة'},
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30, top: 30, left: 30, right: 30),
      padding: EdgeInsets.symmetric(vertical: 20),
      width: 300,
      height: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColor.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex:4,
              child: Image.asset(widget.imagePath)),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 20,left: 40),
            child:   Text(widget.choice1!=null?"Its  _ _ _ _ ":" _ _ _ _  انــــــــها",style: CustomTextStyles.Merriweatherstyle40.copyWith(fontWeight: FontWeight.bold),),
          ),

          Text(widget.choice1!=null?widget.choice1!:"مــــوزة",style:CustomTextStyles.Merriweatherstyle40.copyWith(fontWeight: FontWeight.bold),),
          Text(widget.choice2!=null?widget.choice2!:"بــــرتقالة",style:CustomTextStyles.Merriweatherstyle40.copyWith(fontWeight: FontWeight.bold),),
          Text(widget.choice3!=null?widget.choice3!:"تــــفاحة",style:CustomTextStyles.Merriweatherstyle40.copyWith(fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.only(
                left: 100,right:80,bottom: 10),
            child: CustomTextField(
              textHint: widget.choice1!=null?"Answer":"الاجـــــــابة  ", nameField: widget.Answer,direction: true,style: true,),
          )
        ],
      ),
    );
  }
}


