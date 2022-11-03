import 'package:canario_fut/models/matches.dart';
import 'package:canario_fut/repositories/team_repository.dart';
import 'package:dio/dio.dart';

class MatchesRepository {
  Dio? dio;

  MatchesRepository({Dio? client}) : dio = client ?? Dio();

  Future<List<Matches>> fetchMatches() async {
    final matchDay = await TeamRepository().matchDay();

    // print("\n\n --> $matchDay \n\n");

    final url =
        "http://api.football-data.org//v4/competitions/BSA/matches?matchday=${matchDay.toString()}";
    final response = await dio!.get(
      url,
      options: Options(headers: <String, String>{
        "X-Auth-Token": "9d30da71251042ecbda71532b9f3b031"
      }),
    );

    var mapScorers = response.data as Map;
    var listScorers = mapScorers["matches"] as List;

    return listScorers.map((e) => Matches.fromJson(e)).toList();
  }
}

void main(List<String> args) {
  MatchesRepository().fetchMatches();
}
