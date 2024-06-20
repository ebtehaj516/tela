import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tela/core/database/sql.dart';
import 'package:tela/core/utils/app_colors.dart';
import 'package:tela/core/utils/app_text_style.dart';

import '../../core/Functions/functions.dart';
import '../../core/database/cash/cache_helper.dart';
import '../../core/services/service_locator.dart';
import '../../core/widgets/custom_btn.dart';

class Clothes extends StatefulWidget {
  Clothes({super.key, required this.typePerson});

  final String typePerson;

  @override
  State<Clothes> createState() => _ClothesState();
}

class _ClothesState extends State<Clothes> {
  List girlClothes = [
    "girl1.jpg",
    "girl2.jpg",
    "girl3.jpg",
    "girl4.jpg",
    "girl5.jpg",
    "girl6.jpg",
    "girl7.jpg",
    "girl8.jpg",
    "girl9.jpg",
    "girl10.jpg",
    "girl11.jpg",
    "girl12.jpg",
    "girl13.jpg",
    "girl14.jpg",
  ];

  Sql sql = Sql();

  List boyClothes = [
    "boy1.jpg",
    "boy2.jpg",
    "boy3.jpg",
    "boy4.jpg",
    "boy5.jpg",
    "boy6.jpg",
    "boy7.jpg",
    "boy8.jpg",
    "boy9.jpg",
    "boy10.jpg",
    "boy11.jpg",
    "boy12.jpg",
    "boy13.jpg",
    "boy15.jpg",
    "boy16.jpg",
  ];

  List Choice = [];
  var userId = getIt<CacheHelper>().getData(key: "login");

  readUserScore() async {
    var response = await sql.readUserScore(userId);
    if (response == true) {
        print(sql.score);


    } else {
      return 0;
    }
  }

  bool isNoScore = false;

  @override
  Widget build(BuildContext context) {
    var score = sql.score;
    var userType = getIt<CacheHelper>().getData(key: "fromHomePage");
    int count = 0;
    int countAdd = 0;
    int countInserted = 0;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.primaryColor.withOpacity(0.8),
      body: SafeArea(
          child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              color: AppColor.primaryColor.withOpacity(0.5),
              child: Column(
                children: [
                  if (isNoScore)
                    Padding(
                      padding: EdgeInsets.only(top: 10,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "The Score = 0 ,you don't buy Clothes",
                            style: CustomTextStyles.Merriweatherstyle15.copyWith(
                                color: AppColor.red, fontSize: 14),
                          ),
                          GestureDetector(
                            onTap: (){
                              customReplacementNavigate(
                                  context, '/HomePage');
                            },
                            child: Text("Exit",style: CustomTextStyles.Merriweatherstyle15.copyWith(
                                fontSize: 14,color: Colors.blueAccent),),
                          ),
                        ],
                      ),
                    ),
                  if (isNoScore == false)
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, bottom: 20, left: 150),
                      child: CustomBtn(
                          text: (userType == 2) ? "Choice" : "Register",
                          width: 160,
                          height: 70,
                          onPressed: () {
                            setState(() {
                              readUserScore();
                            });
                            if (userType == 2) {
                              for (int i = 0; i < count; i++) {
                                if (score>=10) {
                                  score -= 10;
                                  countAdd++;
                                  isNoScore = false;
                                  setState(() {
                                    sql.updateData(
                                        "update UserInformation set score='${score}' where user_id ='${userId}'");
                                    readUserScore();
                                  });
                                } else {
                                  setState(() {
                                    isNoScore = true;
                                  });
                                }
                              }
                              print(score);
                              //var scoreNew= getIt<CacheHelper>().saveData(key: "NewScore", value: score);
                              for (int i = 0; i < countAdd; i++) {
                                var result2 = sql.insertData(
                                    'INSERT INTO Clothes(image_clothes,user_id) VALUES("${Choice[i]}", "${userId}")');
                                countInserted++;
                              }
                              if (countInserted > 0) {
                                print(countInserted);
                                print("Inserted data");
                                getIt<CacheHelper>().saveData(key: "scoreUpdate", value: score);
                                if (isNoScore == false)
                                  customReplacementNavigate(
                                      context, '/HomePage');
                              } else {
                                print("no inserted ");
                              }
                            } else {
                              if(isNoScore==false)
                              GoRouter.of(context)
                                  .push('/Signup', extra: Choice);
                            }
                          }),
                    ),
                  Expanded(
                    child: GridView.builder(
                        itemCount: girlClothes.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Choice.add((widget.typePerson == "Boy")
                                  ? boyClothes[index]
                                  : girlClothes[index]);
                              count++;
                            },
                            child: Container(
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10, top: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColor.gray,
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(90),
                                    child: (widget.typePerson == "Boy")
                                        ? Image.asset(
                                            "assets/images/boy/${boyClothes[index]}",
                                            width: 50,
                                            height: 50,
                                          )
                                        : Image.asset(
                                            "assets/images/girl/${girlClothes[index]}",
                                            width: 50,
                                            height: 50,
                                          ))),
                          );
                        }),
                  ),
                ],
              ))),
    );
  }
}
