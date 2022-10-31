class Scorer {
  Player? player;
  Team? team;
  int? goals;
  int? assists;
  int? penalties;

  Scorer({this.player, this.team, this.goals, this.assists, this.penalties});

  Scorer.fromJson(Map<String, dynamic> json) {
    player =
        json['player'] != null ? Player.fromJson(json['player']) : null;
    team = json['team'] != null ? Team.fromJson(json['team']) : null;
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

class Player {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? nationality;
  String? position;
  int? shirtNumber;
  String? lastUpdated;

  Player(
      {this.id,
      this.name,
      this.firstName,
      this.lastName,
      this.dateOfBirth,
      this.nationality,
      this.position,
      this.shirtNumber,
      this.lastUpdated});

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    dateOfBirth = json['dateOfBirth'];
    nationality = json['nationality'];
    position = json['position'];
    shirtNumber = json['shirtNumber'];
    lastUpdated = json['lastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['dateOfBirth'] = dateOfBirth;
    data['nationality'] = nationality;
    data['position'] = position;
    data['shirtNumber'] = shirtNumber;
    data['lastUpdated'] = lastUpdated;
    return data;
  }
}

class Team {
  int? id;
  String? name;
  String? shortName;
  String? tla;
  String? crest;
  String? address;
  String? website;
  int? founded;
  String? clubColors;
  String? venue;
  String? lastUpdated;

  Team(
      {this.id,
      this.name,
      this.shortName,
      this.tla,
      this.crest,
      this.address,
      this.website,
      this.founded,
      this.clubColors,
      this.venue,
      this.lastUpdated});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['shortName'];
    tla = json['tla'];
    crest = json['crest'];
    address = json['address'];
    website = json['website'];
    founded = json['founded'];
    clubColors = json['clubColors'];
    venue = json['venue'];
    lastUpdated = json['lastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['shortName'] = shortName;
    data['tla'] = tla;
    data['crest'] = crest;
    data['address'] = address;
    data['website'] = website;
    data['founded'] = founded;
    data['clubColors'] = clubColors;
    data['venue'] = venue;
    data['lastUpdated'] = lastUpdated;
    return data;
  }
}
