import 'package:canario_fut/models/scorer.dart';
import 'package:dio/dio.dart';

class ScorersRepository {
  Dio? dio;
  final url = "http://api.football-data.org//v4/competitions/WC/scorers";

  ScorersRepository({Dio? client}) : dio = client ?? Dio();

  Future<List<Scorer>> fetchScorers() async {
    final response = await dio!.get(
      url,
      options: Options(headers: <String, String>{
        "X-Auth-Token": "9d30da71251042ecbda71532b9f3b031"
      }),
    );

    var mapScorers = response.data as Map;
    var listScorers = mapScorers["scorers"] as List;

    return listScorers.map((e) => Scorer.fromJson(e)).toList();
  }

  Future<Map<String, dynamic>> fetchData() async {
    final response = await dio!.get(
      url,
      options: Options(headers: <String, String>{
        "X-Auth-Token": "9d30da71251042ecbda71532b9f3b031"
      }),
    );

    var mapScorers = response.data as Map;
    return mapScorers['competition'];
  }
}

Future<void> main(List<String> args) async {
  var scorers = await ScorersRepository().fetchData();
  print(scorers['name']);
}
