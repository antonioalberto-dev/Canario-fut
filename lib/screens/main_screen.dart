import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/time.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Future<List> findMatch() async {
  
  List<dynamic> times = [];

  var url =
      Uri.parse('http://api.football-data.org//v4/competitions/BSA/standings');

  var response = await http.get(url, headers: <String, String>{
    "X-Auth-Token": "9d30da71251042ecbda71532b9f3b031"
  });

  if (response.statusCode == 200) {
    Map<String, dynamic> decodedJson = jsonDecode(response.body);
    List<dynamic> standings = decodedJson['standings'];
    Map<String, dynamic> tabRegularSeason = standings[0];
    List<dynamic> tableTeams = tabRegularSeason['table'];

    // times e suas classificacoes
    for (var time in tableTeams) {
      times.add(Time(
        position: time['position'],
        shortName: time['team']['shortName'],
      ));
    }

    print(times);
    return times;
  } else {
    print('Error Get API');
    return [];
    // return [];
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
    );
  }
}