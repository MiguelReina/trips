import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/User/ui/screens/profile_header.dart';
import 'package:trips/widgets/button.dart';
import '../User/bloc/bloc_user.dart';
import '../widgets/button_green.dart';
import '../widgets/gradient_back.dart';

class HomeNotification extends StatefulWidget {
  const HomeNotification({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeNotification();
  }
}

class _HomeNotification extends State<HomeNotification> {
  late BlocUser blocUser;

  @override
  Widget build(BuildContext context) {
    blocUser = BlocProvider.of(context);
    return signOutGoogle();
  }

  Widget signOutGoogle() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack("", 1000),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileHeader(),
                const Text(
                  "Notificaciones:\nBienvenidos a la aplicación.",
                  style: TextStyle(
                    fontFamily: "lato",
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                ButtonGreen("Cerrar Sesión", () {
                  blocUser.SignOut().then(print("Cerro la sesión"));
                }, 300.0, 50.0),
              ])
        ],
      ),
    );
  }
}
