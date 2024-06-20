import 'package:flutter/material.dart';
import 'package:tela/core/database/sql.dart';
import 'package:tela/core/utils/app_colors.dart';
import 'package:tela/core/utils/app_text_style.dart';
import 'package:tela/features/games_and_story/model/storymodel.dart';

import '../../core/Functions/functions.dart';
import '../../core/database/cash/cache_helper.dart';
import '../../core/services/service_locator.dart';

class Story extends StatefulWidget {
  Story({super.key, required this.storyModel});

  StoryModel storyModel;

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  Sql sql = Sql();

  @override
  Widget build(BuildContext context) {
    var userId = getIt<CacheHelper>().getData(key: "login");
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColor.primaryColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: IconButton(
                          onPressed: () {
                            final result = sql.insertData(
                                'INSERT INTO History(name_of_content,user_id) VALUES("${widget.storyModel.title}", "${userId}")');
                            if (result != null) {
                              customRemoveNavigate(context);
                              print("Inserted data");
                            } else {
                              print("no inserted ");
                            }
                          },
                          icon: Icon(Icons.arrow_back_ios),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.white3,
                        ),
                      ),
                      Container(
                        width: 220,
                        margin: EdgeInsets.only(right: 50, top: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                        child: Text(
                          widget.storyModel.title,
                          style: CustomTextStyles.Merriweatherstyle15.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.white3,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40, bottom: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.white3,
                    ),
                    child: Text(
                      widget.storyModel.textStory,
                      style: CustomTextStyles.Merriweatherstyle15,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
