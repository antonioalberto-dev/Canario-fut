import 'package:canario_fut/screens/matches_screen.dart';
import 'package:canario_fut/screens/ranking.dart';
import 'package:canario_fut/screens/scorers_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Ranking(),
    MatchesScreen(),
    ScorersScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, toolbarHeight: 0),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart_outlined),
            label: 'Classif.',
            tooltip: "Classificação",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_sharp),
            label: 'Partidas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_score_rounded),
            label: 'Artilharia',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.teal[300],
        onTap: _onItemTapped,
      ),
    );
  }
}
