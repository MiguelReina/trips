import 'package:flutter/material.dart';
import 'card_image.dart';

// ignore: must_be_immutable
class CardImageList extends StatelessWidget {
  String path = "assets/img/mountain.jpeg";

  CardImageList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.0,
      child: ListView(
        padding: const EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: [
          CardImage(path),
          CardImage(path),
          CardImage(path),
          CardImage(path),
          CardImage(path),
        ],
      ),
    );
  }
}