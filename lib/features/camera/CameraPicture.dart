import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tela/core/utils/app_colors.dart';
import 'package:tela/core/utils/app_text_style.dart';
import 'package:translator/translator.dart';

import '../../core/Functions/functions.dart';
import '../../core/widgets/custom_btn.dart';

class CameraPicture extends StatefulWidget {
  const CameraPicture({super.key});

  @override
  State<CameraPicture> createState() => _CameraPictureState();
}

class _CameraPictureState extends State<CameraPicture> {
  FlutterTts flutterTts = FlutterTts();
  GoogleTranslator translator = GoogleTranslator();
  String imageLabels = '';
  File? _pickedImage;
  String nameOfImage = "Chair";
  String nameOfImageAr = "";
  String descriptionOfImage = "This used for ";
  String descriptionOfImageAr = "";
  String labelText="";

  void textToSpeech(String text, String languge) async {
    await flutterTts.setLanguage(languge);
    await flutterTts.setVolume(0.5);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  String translateNameofImage() {
    translator.translate(nameOfImage, to: 'ar', from: 'en').then((result) {
      nameOfImageAr = result.toString();
      print(nameOfImageAr);
    });
    return nameOfImageAr;
  }

  String translateDescriptionOfImage() {
    translator
        .translate(descriptionOfImage, to: 'ar', from: 'en')
        .then((result) {
      descriptionOfImageAr = result.toString();
      print(descriptionOfImageAr);
    });
    return descriptionOfImageAr;
  }

  @override
  Widget build(BuildContext context) {
    descriptionOfImage += imageLabels;
    nameOfImage=labelText;
    var nameImage = translateNameofImage();
    var descriptionImage = translateDescriptionOfImage();
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 27, left: 5, right: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 30,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 40,
                      color: AppColor.black,
                    ),
                    onPressed: () {
                      customRemoveNavigate(context);
                    },
                  ),
                ),
                Expanded(
                    child: _pickedImage == null
                        ? const Center(child: Text("No image Sellected"))
                        : Image.file(_pickedImage!)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 130, left: 130, top: 20, bottom: 7),
            child: CustomBtn(
              text: nameImage.toString(),
              color: AppColor.purple,
              onPressed: () {
                textToSpeech(nameImage.toString(), 'ar');
              },
              width: 200,
              height: 70,
              style: CustomTextStyles.Merriweather100style90.copyWith(
                  color: AppColor.white),
            ),
          ),
          InkWell(
            onTap: () {
              textToSpeech(descriptionImage.toString(), 'ar');
            },
            child: Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              width: 400,
              height: 20,
              child: Text(
                descriptionImage.toString(),
                textDirection: TextDirection.ltr,
                style: CustomTextStyles.MerriweatherBlackstyle24.copyWith(
                  color: AppColor.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7, left: 30, bottom: 7),
            child: CustomBtn(
              text: nameOfImage,
              color: AppColor.cyan2,
              onPressed: () {
                textToSpeech(nameOfImage, 'en-US');
              },
              width: 200,
              height: 70,
              style: CustomTextStyles.Merriweather100style90.copyWith(
                  color: AppColor.white, fontSize: 30),
            ),
          ),
          InkWell(
            onTap: () {
              textToSpeech(descriptionOfImage, 'en-US');
            },
            child: Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              width: 400,
              height: 20,
              child: Text(
                descriptionOfImage,
                style: CustomTextStyles.MerriweatherBlackstyle24.copyWith(
                    color: AppColor.black, fontSize: 12),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 72, right: 100),
            child: CustomBtn(
              text: "take picture...",
              onPressed: () => pickImage(ImageSource.camera),
              width: 320,
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2, left: 270, bottom: 10),
            child: CustomBtn(
              text: "",
              width: 90,
              height: 55,
              onPressed: () {
                customNavigate(context, '/HomePage');
              },
            ).customButton(
              const Icon(
                Icons.home_outlined,
                size: 60,
                color: AppColor.black,
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile == null) return;
    getImageLabels(pickedFile);
    setState(() {
      _pickedImage = File(pickedFile.path);
    });
  }

  Future<void> getImageLabels(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    ImageLabeler imageLabeler =
        ImageLabeler(options: ImageLabelerOptions());
    List<ImageLabel> labels = await imageLabeler.processImage(inputImage);

    StringBuffer sb = StringBuffer();
    for (ImageLabel imageLabel in labels) {
      labelText = imageLabel.label;
      double confidence = imageLabel.confidence;
      sb.write(labelText);
      sb.write(" and ");
    }
    imageLabeler.close();
    imageLabels = sb.toString();
    setState(() {});
  }
}
