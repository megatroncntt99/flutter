import 'package:flutter/material.dart';
import 'package:flutter_covid_19/screens/home_screen.dart';

import 'stats_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    HomeScreen(),
    StatsScreen(),
    Scaffold(),
    Scaffold(),
  ];
  final List _icons = [
    Icons.home,
    Icons.insert_chart,
    Icons.event,
    Icons.info,
  ];
  int currenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[currenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currenIndex,
        onTap: (value) => this.setState(() {
          currenIndex = value;
        }),
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: _icons
            .asMap()
            .map((key, value) => MapEntry(
                key,
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  label: "",
                  icon: Container(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color:
                          currenIndex == key ? Colors.blue : Colors.transparent,
                    ),
                    child: Icon(
                      value,
                      color: currenIndex == key ? Colors.white : Colors.grey,
                    ),
                  ),
                )))
            .values
            .toList(),
      ),
    );
  }
}
