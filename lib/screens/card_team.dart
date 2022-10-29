import 'package:canario_fut/models/RatingTable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardTeam extends StatelessWidget {
  final RatingTable team;

  CardTeam({Key? key, required this.team}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorCard(team.position),
      margin: const EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
      elevation: 2,
      child: ListTile(
        leading: Text(
          team.position.toString(),
          style: const TextStyle(fontSize: 12),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              team.team!.tla.toString(),
              style: const TextStyle(fontSize: 12),
            ),
            Text(
              team.points.toString(),
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

Color? colorCard(int? position) {
  if (position! <= 4) {
    return Colors.green[200];
  } else if (position >= 17) {
    return Colors.red[200];
  } else if (position <= 6) {
    return Colors.orangeAccent[200];
  }
  return null;
}
