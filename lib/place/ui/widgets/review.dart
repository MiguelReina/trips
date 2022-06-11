import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  String path;
  String name;
  int review;
  int photos;
  String comment;

  Review(this.path, this.name, this.review, this.photos, this.comment);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //------Iconos de estrellas------
    final star = Container(
      margin: EdgeInsets.only(right: 1.0),
      child: Icon(Icons.star, color: Color(0xFFF2C611), size: 10.0),
    );
    final star_half = Container(
      margin: EdgeInsets.only(right: 1.0),
      child: Icon(Icons.star_half, color: Color(0xFFF2C611), size: 10.0),
    );
    final star_border = Container(
      margin: EdgeInsets.only(right: 1.0),
      child: Icon(Icons.star_border, color: Color(0xFFF2C611), size: 10.0),
    );

    final userName = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        name,
        style: TextStyle(
            fontSize: 17.0, fontWeight: FontWeight.bold, fontFamily: "Lato"),
      ),
    );

    final views = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        "$review review $photos photos",
        style: TextStyle(
            fontSize: 10.0, fontFamily: "Lato", color: Color(0xFFA3A5A7)),
      ),
    );

    final data = Row(
      children: [
        views,
        Row(children: [star, star, star, star, star_border])
      ],
    );

    final description = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        comment,
        style: TextStyle(fontSize: 13.0, fontFamily: "Lato"),
      ),
    );

    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [userName, data, description],
    );

    final foto = Container(
      margin: EdgeInsets.only(top: 20.0, left: 20.0),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(path)),
      ),
    );

    return Row(
      children: [foto, info],
    );
  }
}
