import 'team.dart';

class RatingTable {
  int? position;
  Team? team;
  int? playedGames;
  String? form;
  int? won;
  int? draw;
  int? lost;
  int? points;
  int? goalsFor;
  int? goalsAgainst;
  int? goalDifference;

  RatingTable(
      {this.position,
      this.team,
      this.playedGames,
      this.form,
      this.won,
      this.draw,
      this.lost,
      this.points,
      this.goalsFor,
      this.goalsAgainst,
      this.goalDifference});

  RatingTable.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    team = json['team'] != null ? Team.fromJson(json['team']) : null;
    playedGames = json['playedGames'];
    form = json['form'];
    won = json['won'];
    draw = json['draw'];
    lost = json['lost'];
    points = json['points'];
    goalsFor = json['goalsFor'];
    goalsAgainst = json['goalsAgainst'];
    goalDifference = json['goalDifference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['position'] = position;
    if (team != null) {
      data['team'] = team!.toJson();
    }
    data['playedGames'] = playedGames;
    data['form'] = form;
    data['won'] = won;
    data['draw'] = draw;
    data['lost'] = lost;
    data['points'] = points;
    data['goalsFor'] = goalsFor;
    data['goalsAgainst'] = goalsAgainst;
    data['goalDifference'] = goalDifference;
    return data;
  }
}
