import 'package:canario_fut/models/ratingTable.dart';
import 'package:flutter/material.dart';

class CardTeam extends StatelessWidget {
  final RatingTable team;

  const CardTeam({Key? key, required this.team}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorCard(team.position),
      margin: const EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
      elevation: 2,
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${team.position.toString()}º",
              style: const TextStyle(fontSize: 14),
            ),
            const Text(
              "LUGAR",
              style: TextStyle(
                fontSize: 7,
              ),
            ),
          ],
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              team.team!.tla.toString(),
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  team.points.toString(),
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                const Text(
                  "PONTOS",
                  style: TextStyle(
                    fontSize: 6,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Color? colorCard(int? position) {
  if (position! <= 4) {
    return Colors.teal[100];
  } else if (position >= 17) {
    return Colors.red[100];
  } else if (position <= 6) {
    return Colors.orangeAccent[100];
  }
  return null;
}
