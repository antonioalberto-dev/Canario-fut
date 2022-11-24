// ignore_for_file: sort_child_properties_last

import 'package:canario_fut/controllers/home_controller.dart';
import 'package:canario_fut/controllers/state_enum.dart';
import 'package:canario_fut/models/ratingTable.dart';
import 'package:flutter/material.dart';

import '../widgets/card_team.dart';

class Ranking extends StatefulWidget {
  const Ranking({Key? key}) : super(key: key);

  @override
  State<Ranking> createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  final controller = HomeController();

  _success() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 65,
                child: Image(
                  image: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/pt/4/42/Campeonato_Brasileiro_S%C3%A9rie_A_logo.png",
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Classificação',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showSimpleDialog(context);
                        },
                        icon: const Icon(
                          Icons.info_outline,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                  const Text(
                    'Campeonato Brasileiro 2022 | Série A',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.lightBlue,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: ListView.builder(
              itemCount: controller.allTeams.length,
              itemBuilder: (context, index) {
                RatingTable team = controller.allTeams[index];
                return CardTeam(team: team, index: index);
              },
            ),
          ),
        ],
      ),
    );
  }

  _error() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Não foi possível carregar classificação',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        const Divider(
          color: Colors.transparent,
          height: 5,
        ),
        const Text(
          'Verifique sua conexão com a internet',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 12,
          ),
        ),
        const Divider(
          color: Colors.transparent,
        ),
        ElevatedButton(
          child: const Text('Tente novamente'),
          onPressed: () {
            controller.start();
          },
        ),
      ],
    );
  }

  _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  stateManagement(StateEnum state) {
    switch (state) {
      case StateEnum.start:
        return _start();
      case StateEnum.loading:
        return _loading();
      case StateEnum.error:
        return _error();
      case StateEnum.success:
        return _success();
      default:
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.state,
      builder: (context, child) {
        return stateManagement(controller.state.value);
      },
    );
  }
}

void showSimpleDialog(BuildContext context) => showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: const Text("Informações"),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 10),
                    Icon(
                      Icons.circle_rounded,
                      size: 20,
                      color: Colors.teal,
                    ),
                    SizedBox(width: 10),
                    Text("Libertadores"),
                  ],
                ),
                const Divider(color: Colors.transparent),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 10),
                    Icon(
                      Icons.circle_rounded,
                      size: 20,
                      color: Color.fromARGB(255, 72, 134, 241),
                    ),
                    SizedBox(width: 10),
                    Text("Pré-libertadores"),
                  ],
                ),
                const Divider(color: Colors.transparent),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 10),
                    Icon(
                      Icons.circle_rounded,
                      size: 20,
                      color: Color.fromARGB(255, 250, 163, 157),
                    ),
                    SizedBox(width: 10),
                    Text("Rebaixamento"),
                  ],
                ),
              ],
            ),
          ),
        ],
        // contentPadding: const EdgeInsets.all(10.0),
      );
    });
