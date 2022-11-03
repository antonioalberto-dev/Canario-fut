import 'package:canario_fut/models/ratingTable.dart';
import 'package:flutter/material.dart';

class CardTeam extends StatelessWidget {
  final RatingTable team;
  final int index;

  const CardTeam({Key? key, required this.team, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorCard(index),
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
      elevation: 2,
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${team.position.toString()}º",
              style: const TextStyle(
                fontSize: 14,
              ),
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
              team.team!.shortName.toString(),
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      team.playedGames.toString(),
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const Text(
                      "Jogos",
                      style: TextStyle(
                        fontSize: 6,
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${team.won.toString()} V",
                      style: const TextStyle(
                        fontSize: 9,
                      ),
                    ),
                    Text(
                      "${team.draw.toString()} E",
                      style: const TextStyle(
                        fontSize: 9,
                      ),
                    ),
                    Text(
                      "${team.lost.toString()} D",
                      style: const TextStyle(
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Color colorCard(int position) {
  if (position <= 3) {
    return Color.fromARGB(255, 13, 187, 170);
  } else if (position >= 16) {
    return Color.fromARGB(255, 250, 163, 157);
  } else if (position <= 5) {
    return Color.fromARGB(255, 151, 185, 244);
  }
  return Colors.white;
}

Color colorCardText(int position) {
  if (position <= 4) {
    return Colors.white;
  } else if (position >= 17) {
    return Colors.white;
  } else if (position <= 6) {
    return Colors.white;
  }
  return Colors.black;
}
