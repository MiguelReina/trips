import 'package:flutter/material.dart';
import '../../alarm/model/alarm.dart';

class UserL {
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  List<Alarm>? myAlarm;

  UserL({
    required this.uid,
    required this.name,
    required this.email,
    required this.photoURL,
    this.myAlarm,
  });
}
