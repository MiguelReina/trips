import 'package:flutter/material.dart';
import 'package:trips/place/ui/screens/home_trips.dart';
import 'package:trips/screens/home_notification.dart';
import 'package:trips/widgets/button_green.dart';
import 'package:trips/widgets/gradient_back.dart';
import 'package:trips/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/user.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  late BlocUser blocUser;

  @override
  Widget build(BuildContext context) {
    blocUser = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: blocUser.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return signInGoogleUI();
        } else {
          return HomeNotification();
        }
      },
    );
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack("", 1000),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Bienvenido\nEste es tu primer viaje",
              style: TextStyle(
                fontFamily: "lato",
                fontSize: 35.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            ButtonGreen("Ingresar con Gmail", () {
              blocUser.signIn().then((UserCredential user) {
                print("Este es el usuario loggeado: $user");
                // blocUser.updateUserData(UserL(
                //   uid: user.uid,
                //   name: user.displayName,
                //   email: user.email,
                //   photoURL: user.photoURL,
                // ));
              });
            }, 300.0, 50.0)
          ])
        ],
      ),
    );
  }
}
