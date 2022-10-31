class TeamPlayer {
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

  TeamPlayer(
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

  TeamPlayer.fromJson(Map<String, dynamic> json) {
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
