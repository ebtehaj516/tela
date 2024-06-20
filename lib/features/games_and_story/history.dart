import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tela/core/database/sql.dart';
import 'package:tela/core/services/service_locator.dart';
import 'package:tela/core/utils/app_text_style.dart';
import '../../core/Functions/functions.dart';
import '../../core/database/cash/cache_helper.dart';
import '../../core/utils/app_colors.dart';

class History extends StatefulWidget {
  const History({super.key, required this.second});

  final int second;

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  Sql sql = Sql();
  int _seconds = 0;

  @override
  void initState() {
    _seconds = widget.second;
    // TODO: implement initState
    super.initState();
    Timer.periodic(
        const Duration(
          seconds: 1,
        ), (timer) {
      setState(() {
        _seconds++;
        if (_seconds == 3600) {
          exit(0);
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userId = getIt<CacheHelper>().getData(key: "login");
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.white4,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 4),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 40,
                  ),
                  onPressed: () {
                    customRemoveNavigate(context);
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 20),
                child: Text("parent tracking",style: CustomTextStyles.Merriweatherstyle40,),
              ),
           Padding(
                padding: const EdgeInsets.only(bottom: 10,left: 130,),
                child: Text('$_seconds',style: CustomTextStyles.Interstyle25.copyWith(fontSize: 18),),
              ),
              Container(
                margin: EdgeInsets.only(left: 48, right: 60),
                width: 300,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(41),
                  color: AppColor.primaryColor,
                ),
                child: Center(
                    child: Text(
                  "history",
                  style: CustomTextStyles.MerriweatherBlackstyle24.copyWith(
                      fontSize: 25, color: AppColor.white),
                )),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height / 2,
                child: FutureBuilder(
                    future: sql.readData(
                        'SELECT * FROM History WHERE user_id=${userId}'),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data.length == 0) {
                        return const Center(
                            child: Text("you don't play or read Story  "));
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    snapshot.data[index]['image'] != null
                                        ? snapshot.data[index]['image']
                                        : "assets/images/image6.png",
                                    width: 100,
                                    height: 100,
                                  ),
                                  Container(
                                    width: 150,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Text(snapshot.data[index]
                                        ['name_of_content']),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: AppColor.primaryColor),
                                  ),
                                ],
                              );
                            });
                      }
                    }),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                width: 496,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(42),
                    color: AppColor.white1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/SpeechBubble.png"),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Text("contact us",style: CustomTextStyles.MerriweatherBlackstyle24,),
                       Text("stating time1:34 pm",style: CustomTextStyles.Interstyle25.copyWith(fontSize: 14))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
