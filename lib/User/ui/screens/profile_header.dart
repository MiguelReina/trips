import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/User/bloc/bloc_user.dart';
import 'package:trips/User/model/user.dart';

import '../widgets/user_info.dart';

class ProfileHeader extends StatelessWidget {
  late BlocUser blocUser;
  late UserL user;
  @override
  Widget build(BuildContext context) {
    blocUser = BlocProvider.of<BlocUser>(context);
    return StreamBuilder(
      stream: blocUser.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return showProfile(snapshot);
          case ConnectionState.active:
            return showProfile(snapshot);
          case ConnectionState.done:
            return showProfile(snapshot);
        }
      },
    );
  }

  Widget showProfile(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      print("No está loggeado");
      return Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 50,
        ),
        child: Column(children: const [
          CircularProgressIndicator(),
          Text("No se pudo cargar la información")
        ]),
      );
    } else {
      print("Loggeado");
      user = UserL(
          uid: '1',
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL);
      const title = Text(
        'Profile',
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
      );

      return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            Row(
              children: const <Widget>[title],
            ),
            UserInfo(user),
          ],
        ),
      );
    }
  }
}
