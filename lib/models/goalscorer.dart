import 'package:canario_fut/models/player.dart';
import 'package:canario_fut/models/team_player.dart';

class Goalscorer {
  Player? player;
  TeamPlayer? team;
  int? goals;
  int? assists;
  int? penalties;

  Goalscorer(
      {this.player, this.team, this.goals, this.assists, this.penalties});

  Goalscorer.fromJson(Map<String, dynamic> json) {
    player =
        json['player'] != null ? Player.fromJson(json['player']) : null;
    team = json['team'] != null ? TeamPlayer.fromJson(json['team']) : null;
    goals = json['goals'];
    assists = json['assists'];
    penalties = json['penalties'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (player != null) {
      data['player'] = player!.toJson();
    }
    if (team != null) {
      data['team'] = team!.toJson();
    }
    data['goals'] = goals;
    data['assists'] = assists;
    data['penalties'] = penalties;
    return data;
  }
}