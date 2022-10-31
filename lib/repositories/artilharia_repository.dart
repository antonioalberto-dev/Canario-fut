import 'package:canario_fut/models/ratingTable.dart';
import 'package:dio/dio.dart';

// import 'package:http/http.dart' as http;

class ArtilhariaRepository {
  Dio? dio;
  final url = "http://api.football-data.org//v4/competitions/BSA/scorers";

  ArtilhariaRepository({Dio? client}) : dio = client ?? Dio();

  Future<List> fetchTeams() async {
    final response = await dio!.get(
      url,
      options: Options(headers: <String, String>{
        "X-Auth-Token": "9d30da71251042ecbda71532b9f3b031"
      }),
    );

    var mapStandings = response.data as Map;
    var listStandings = mapStandings["scorers"] as List;

    // return listTeams.map((e) => RatingTable.fromJson(e)).toList();
    print(listStandings);
    return listStandings;
  }
}

Future<void> main(List<String> args) async {
  var list = await ArtilhariaRepository().fetchTeams();

  // print(list);

  list.forEach((element) {
    print(element);
  });
}
