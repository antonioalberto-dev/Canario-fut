import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/time.dart';

Future<List> findMatch() async {
  List<Time> times = [];

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

    // times.forEach((element) {
    //   print(element.shortName);
    // });

    // print(times);
    return times;
  } else {
    print('Error Get API');
    return [];
  }
}

Future main() async {
  final times = await findMatch();
}
