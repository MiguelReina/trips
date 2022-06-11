import 'package:flutter/material.dart';
class FloatingActionButtonGreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatingActionButtonGreen();
  }

}
class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {
  bool press = false;
  void onPressedFav(){
    Scaffold.of(context).showSnackBar(SnackBar(content: Text( ((press)?"Eliminaste de ":"Agregaste a ") + "favoritos")));
    setState(() {
      press = !press;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: onPressedFav,
      child: Icon(
          (press)?Icons.favorite:Icons.favorite_border,
      )
    );
  }

}