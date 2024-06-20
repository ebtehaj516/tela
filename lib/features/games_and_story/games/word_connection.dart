import 'package:flutter/material.dart';
import 'package:tela/core/widgets/custom_btn.dart';

import '../../../core/utils/app_colors.dart';
import '../model/wordModel.dart';

class WordConnection extends StatefulWidget {
  const WordConnection({super.key});

  @override
  State<WordConnection> createState() => _WordConnectionState();
}

class _WordConnectionState extends State<WordConnection> {
  List<WordModel> wordsArabic = [];
  List<WordModel> wordsEnglish = [];
  int score = 0;
  int count = 0;
  bool gameOver = true;

  intGame() {
    gameOver = false;
    score = 0;
    wordsArabic = [
      WordModel(name: 'أسد', value: 'lion'),
      WordModel(name: 'قطة', value: 'cat'),
      WordModel(name: 'كلب', value: 'dog'),
      WordModel(name: 'كرسي', value: 'chair'),
      WordModel(name: 'قلم', value: 'pen'),
      WordModel(name: 'كتاب', value: 'book'),
      WordModel(name: 'صندوق', value: 'box'),
      WordModel(name: 'حقيبة', value: 'bag'),
    ];
    wordsEnglish = List<WordModel>.from(wordsArabic);
    wordsArabic.shuffle();
    wordsEnglish.shuffle();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    intGame();
  }

  @override
  Widget build(BuildContext context) {
    if (wordsArabic.length == 0) gameOver = true;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 30, bottom: 60),
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: 'Score :  ',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextSpan(
                      text: '$score',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ])),
                ),
                if (!gameOver)
                  Row(
                    children: [
                      Spacer(),
                      Column(
                        children: wordsArabic.map((item) {
                          return Container(
                            margin: EdgeInsets.all(8),
                            child: Draggable<WordModel>(
                              data: item,
                              childWhenDragging: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[400],
                                ),
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.width / 6.5,
                                width: MediaQuery.of(context).size.width / 3,
                                child: Text(item.value),
                              ),
                              feedback: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[400],
                                ),
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.width / 6.5,
                                width: MediaQuery.of(context).size.width / 3,
                                child: Text(item.value),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[400],
                                ),
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.width / 6.5,
                                width: MediaQuery.of(context).size.width / 3,
                                child: Text(item.value),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      Column(
                        children: wordsEnglish.map((item) {
                          return DragTarget<WordModel>(
                            onAccept: (receivedItem) {
                              if (item.value == receivedItem.value) {
                                setState(() {
                                  wordsArabic.remove(receivedItem);
                                  wordsEnglish.remove(item);
                                });
                                score += 5;
                                item.accepting = false;
                              } else {
                                setState(() {
                                  if (score > 0) {
                                    score -= 5;
                                  }
                                  item.accepting = false;
                                });
                              }
                            },
                            onWillAccept: (receivedItem) {
                              setState(() {
                                item.accepting = true;
                              });
                              return true;
                            },
                            onLeave: (receivedItem) {
                              setState(() {
                                item.accepting = false;
                              });
                            },
                            builder: (context, acceptedItems, rejectedItems) =>
                                Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: item.accepting
                                      ? Colors.grey[400]
                                      : Colors.grey[200]),
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.width / 6.5,
                              width: MediaQuery.of(context).size.width / 3,
                              margin: EdgeInsets.all(8),
                              child: Text(item.name),
                            ),
                          );
                        }).toList(),
                      ),
                      Spacer(),
                    ],
                  ),
                if (gameOver)
                  Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Game Over"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            result(),
                          ),
                        )
                      ],
                    ),
                  ),
                if (gameOver)
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        height: MediaQuery.of(context).size.width / 10,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              intGame();
                            });
                          },
                          child: Text("NewGame"),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        height: MediaQuery.of(context).size.width / 10,
                        width: MediaQuery.of(context).size.width / 5,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(score);
                          },
                          child: Text("Exit"),
                        ),
                      ),
                    ],
                  ),
              ]),
        ),
      ),
    );
  }

  String result() {
    if (score == 100)
      return 'Awesome';
    else {
      return 'Play again to get better Score';
    }
  }
}
