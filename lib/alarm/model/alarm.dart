import 'package:flutter/material.dart';
import 'package:trips/User/model/user.dart';

class Alarm {
  final String aid;
  final String name;
  final String time;
  final UserL userOwner;

  Alarm({
    required this.aid,
    required this.name,
    required this.time,
    required this.userOwner,
  });
}
