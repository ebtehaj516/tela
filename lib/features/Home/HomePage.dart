import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tela/core/database/sql.dart';
import 'package:tela/core/utils/app_colors.dart';
import 'package:tela/core/utils/app_text_style.dart';
import '../../core/database/cash/cache_helper.dart';
import '../../core/services/service_locator.dart';
import '../../core/widgets/backgrond.dart';
import 'Widegets/games.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isNoScore = false;
  int _seconds = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(
        const Duration(
          seconds: 1,
        ), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  Sql sql = Sql();
  var userId = getIt<CacheHelper>().getData(key: "login");

  readUserScore() async {
    var response = await sql.readUserScore(userId);
    if (response == true) {
      print(sql.score);
    }
  }

  @override
  Widget build(BuildContext context) {
    var userType = getIt<CacheHelper>().getData(key: "loginTypeUser");

    return Background(
        child: ListView(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    readUserScore();
                    // print(sql.score);
                    if (sql.score>= 10) {
                      getIt<CacheHelper>()
                          .saveData(key: "fromHomePage", value: 2);
                      GoRouter.of(context).push('/Clothes', extra: userType);
                    } else {
                      setState(() {
                        isNoScore = true;
                        print(isNoScore);
                      });
                    }
                  });
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      (userType == "Boy")
                          ? "assets/images/boy.jpeg"
                          : "assets/images/girl.jpg",
                      width: 80,
                      height: 80,
                    )),
              ),
              Container(
                child: IconButton(
                  icon: const Icon(
                    Icons.menu,
                    size: 40,
                  ),
                  onPressed: () {
                    GoRouter.of(context).push("/History", extra: _seconds);
                  },
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColor.white3,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome to",
                style: CustomTextStyles.Interstyle30,
              ),
              Text(
                "Tela",
                style: CustomTextStyles.Interstyle30.copyWith(fontSize: 40),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 50,
          ),
          child: Column(
            children: [
              const Game(
                text: "Let's Explore",
                containerColor1: AppColor.cyan2,
                containerColor2: AppColor.white,
                image: "assets/images/image1.png",
                path: "/CameraPicture",
              ),
              const Game(
                text: "Let's Learn",
                containerColor1: AppColor.lightGreen,
                containerColor2: AppColor.white,
                image: "assets/images/image2.png",
                path: "/Game",
              ),
              const Game(
                text: "Let's Play",
                containerColor1: AppColor.yellow,
                containerColor2: AppColor.white,
                image: "assets/images/image3.png",
                path: "/Stories",
              ),
              if (isNoScore)
                Text(
                  "The Score = 0 ,you don't buy Clothes",
                  style: CustomTextStyles.Merriweatherstyle15.copyWith(
                      color: AppColor.red, fontSize: 14),
                ),
            ],
          ),
        ),
      ],
    ));
  }
}
