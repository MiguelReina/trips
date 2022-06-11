import 'package:flutter/material.dart';
import 'review.dart';
class ReviewList extends StatelessWidget {
  String path = "assets/img/perfil.jpg";
  String name = "Diana Ramirez";
  int review = 2;
  int photos = 6;
  String comment = "Lorem Ipsum has been";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Review(path, name, review, photos, comment),
        Review(path, name, review, photos, comment),
        Review(path, name, review, photos, comment),
        Review(path, name, review, photos, comment),
        Review(path, name, review, photos, comment),
        Review(path, name, review, photos, comment),
      ],
    );
  }
  
}