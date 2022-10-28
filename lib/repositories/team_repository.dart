import 'dart:convert';

import 'package:canario_fut/models/RatingTable.dart';
import 'package:dio/dio.dart';

import '../models/Team.dart';
// import 'package:http/http.dart' as http;

class TeamRepository {
  Dio? dio;
  final url = "http://api.football-data.org//v4/competitions/BSA/standings";

  TeamRepository({Dio? client}) : dio = client ?? Dio();

  Future fetchTeams() async {
    final response = await dio!.get(
      url,
      options: Options(headers: <String, String>{
        "X-Auth-Token": "9d30da71251042ecbda71532b9f3b031"
      }),
    );

    var mapStandings = response.data as Map;
    var listStandings = mapStandings["standings"] as List;
    mapStandings = listStandings[0];
    final listTeams = mapStandings["table"];

    // return listTeams.forEach((team) {
    //   print(team["team"].toString());
    // });

    return listTeams.forEach((team) => RatingTable.fromJson(team));
  }
}

void main(List<String> args) {
  TeamRepository().fetchTeams();
}
