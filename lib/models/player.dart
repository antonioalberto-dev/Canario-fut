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