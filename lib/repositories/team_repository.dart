import 'dart:convert';
import 'dart:math';

import 'package:canario_fut/models/RatingTable.dart';
import 'package:dio/dio.dart';

import '../models/Team.dart';
// import 'package:http/http.dart' as http;

class TeamRepository {
  Dio? dio;
  final url = "http://api.football-data.org//v4/competitions/BSA/standings";

  TeamRepository({Dio? client}) : dio = client ?? Dio();

  Future<List<RatingTable>> fetchTeams() async {
    final response = await dio!.get(
      url,
      options: Options(headers: <String, String>{
        "X-Auth-Token": "9d30da71251042ecbda71532b9f3b031"
      }),
    );

    var mapStandings = response.data as Map;
    var listStandings = mapStandings["standings"] as List;
    mapStandings = listStandings[0];
    final listTeams = mapStandings["table"] as List;

    return listTeams.map((e) => RatingTable.fromJson(e)).toList();
  }
}

Future<void> main(List<String> args) async {
  var list = await TeamRepository().fetchTeams();
}
