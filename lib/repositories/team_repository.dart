import 'dart:convert';

import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;

class TeamRepository {
  final dio = Dio();
  final url = "http://api.football-data.org//v4/competitions/BSA/standings";
  // final url = Uri.parse("http://api.football-data.org//v4/competitions/BSA/standings");

  Future fetchTeams() async {
    final response = await dio.get(
      url,
      options: Options(headers: <String, String>{
        "X-Auth-Token": "9d30da71251042ecbda71532b9f3b031"
      }),
    );

    var mapStandings = response.data as Map;
    var listStandings = mapStandings["standings"] as List;
    mapStandings = listStandings[0]; 
    final listTeams = mapStandings["table"];

    print(listTeams[2]);
  }
}

void main(List<String> args) {
  TeamRepository().fetchTeams();
}