import 'package:flutter/material.dart';
import '../screens/profile.dart';
import '../screens/search.dart';
import '../place/ui/screens/home_trips.dart';

class Trips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Trips();
  }
}

class _Trips extends State<Trips> {
  int indexTap = 0;
  final List<Widget> widgetsChildren = [HomeTrips(), Search(), Profile()];
  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            primaryColor: Colors.purple,
          ),
          child: BottomNavigationBar(
            unselectedFontSize: 0.0,
            selectedFontSize: 0.0,
            onTap: onTapTapped,
            currentIndex: indexTap,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
            ],
          )),
    );
  }
}
