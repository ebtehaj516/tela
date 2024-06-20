import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tela/core/utils/app_colors.dart';
import '../utils/app_text_style.dart';

//class to text field
class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
      required this.textHint,
      this.field = false,
      required this.nameField,
      this.direction = false,
      this.style = false,
      this.pass1,
      this.pass2});

  final String textHint;
  final bool? direction;

  final bool? field;
  final bool? style;
  TextEditingController? pass1 = TextEditingController();
  TextEditingController? pass2 = TextEditingController();
  TextEditingController nameField = TextEditingController();

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  bool visible = false;
  String? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.nameField,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Field required";
        }
        // else if(value.length<3){
        //   return "At least 3 letter must be entered ";
        // }
        else if (widget.pass1?.text != widget.pass2?.text) {
          return "Passwords don't match";
        }

        return null;
      },
      style: widget.style!
          ? CustomTextStyles.Merriweatherstyle40.copyWith(
              fontWeight: FontWeight.bold)
          : const TextStyle(
              color: AppColor.darkGray,
            ),
      cursorColor: Colors.lightGreen,
      obscureText: visible,
      textDirection: widget.direction! ? TextDirection.rtl : TextDirection.ltr,
      decoration: InputDecoration(
        enabledBorder: underLine(),
        hintTextDirection:
            widget.direction! ? TextDirection.rtl : TextDirection.ltr,
        focusedBorder: underLine(),
        hintText: widget.textHint,
        hintStyle: widget.style!
            ? CustomTextStyles.Merriweatherstyle40.copyWith(
                fontWeight: FontWeight.bold)
            : CustomTextStyles.Merriweatherstyle15,
        suffixIcon: widget.field!
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.grey,
                  size: 18,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                    visible = !_obscureText;
                  });
                },
              )
            : const Padding(
                padding: EdgeInsets.only(right: 18),
              ),
      ),
    );
  }

//function to return under border
  UnderlineInputBorder underLine() {
    return const UnderlineInputBorder(
        borderSide: BorderSide(
      color: AppColor.black1,
      width: 2,
    ));
  }
}
