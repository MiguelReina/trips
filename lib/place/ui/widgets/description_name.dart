import 'package:flutter/material.dart';
import '../../../widgets/button.dart';

class DescriptionPlace extends StatelessWidget {
  String title;
  String content;

  DescriptionPlace(this.title, this.content);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //------Iconos de estrellas------
    final star = Container(
      margin: EdgeInsets.only(top: 323.0, right: 5.0),
      child: Icon(Icons.star, color: Color(0xFFF2C611)),
    );
    final star_half = Container(
      margin: EdgeInsets.only(top: 323.0, right: 5.0),
      child: Icon(Icons.star_half, color: Color(0xFFF2C611)),
    );
    final star_border = Container(
      margin: EdgeInsets.only(top: 323.0, right: 5.0),
      child: Icon(Icons.star_border, color: Color(0xFFF2C611)),
    );

    final title_stars = Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 320.0, left: 20.0, right: 20.0),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Lato"),
          ),
        ),
        Row(
          children: [star, star, star, star_half, star_border],
        )
      ],
    );

    final description = Container(
      margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Text(
        content,
        style: TextStyle(
            fontSize: 14.0,
            color: Color(0xFF56575A),
            fontWeight: FontWeight.bold,
            fontFamily: "Lato"),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [title_stars, description, Button("Navigate")],
    );
  }
}
