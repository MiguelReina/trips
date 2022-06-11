import 'package:flutter/material.dart';
import '../../../widgets/floating_action_button_green.dart';

// ignore: must_be_immutable
class CardImage extends StatelessWidget {
  String path;
  CardImage(this.path, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: 250.0,
      width: 300.0,
      margin: const EdgeInsets.only(
        top: 80.0,
        left: 20.0,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(path)
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        shape: BoxShape.rectangle,
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 0.7),
          )
        ]
      ),
    );

    return Stack(
      alignment: const Alignment(0.9, 1.1),
      children: [
        card,
        FloatingActionButtonGreen(),
      ],
    );
  }
  
}