import 'package:flutter/material.dart';
import 'package:tela/core/utils/app_text_style.dart';

import '../../../core/Functions/functions.dart';
import '../../../core/database/cash/cache_helper.dart';
import '../../../core/services/service_locator.dart';

class Game extends StatefulWidget {
  const Game(
      {super.key,
      required this.text,
      required this.image,
      required this.containerColor1,
      required this.containerColor2,
      required this.path});

  final String text;
  final String image;
  final Color containerColor1;
  final Color containerColor2;
  final String path;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 33, right: 44, bottom: 39),
      child: GestureDetector(
        onTap: () {
          customNavigate(context, widget.path);
        },
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: widget.containerColor1,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60, top: 20),
                      child: Text(
                        widget.text,
                        style: CustomTextStyles.Interstyle25.copyWith(
                            fontSize: 25),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: widget.containerColor2,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                top: 3,
                left: -10,
                bottom: 2,
                child: Image.asset(
                  widget.image,
                  width: 130,
                  height: 130,
                )),
          ],
        ),
      ),
    );
  }
}
