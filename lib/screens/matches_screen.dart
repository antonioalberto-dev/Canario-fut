// ignore_for_file: unnecessary_string_interpolations

import 'package:canario_fut/controllers/matches_controller.dart';
import 'package:flutter/material.dart';

import '../controllers/state_enum.dart';
import '../models/matches.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  final controller = MatchesController();

  _success() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 20),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'JOGOS DA RODADA ${controller.matches[0].season!.currentMatchday}',
                      style: const TextStyle(
                        fontSize: 16,
                        // letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Campeonato Brasileiro 2022 | Série A',
                      style: TextStyle(
                        fontSize: 10,
                        // fontStyle: FontStyle.italic,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .75,
            child: GridView.builder(
              padding: const EdgeInsets.only(left: 10, right: 10),
              itemCount: controller.matches.length,
              itemBuilder: (context, index) {
                Matches match = controller.matches[index];
                return Card(
                  elevation: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                match.homeTeam!.tla.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  match.score!.fullTime!.home.toString() == null
                                      ? match.score!.fullTime!.home.toString()
                                      : "0")
                            ],
                          ),
                          const Text("X"),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(match.awayTeam!.tla.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  match.score!.fullTime!.away.toString() == null
                                      ? match.awayTeam!.tla.toString()
                                      : "0")
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                            decoration: const BoxDecoration(
                                color: Colors.teal,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              getDate(match.utcDate.toString()),
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.white),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 72, 134, 241),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              "${getTime(match.utcDate.toString())}",
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 0.8,
                mainAxisSpacing: 0.3,
              ),
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
          'Não foi possível carregar os jogos',
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

String getDate(String date) {
  var dateDateTime =
      DateTime.parse("${date.substring(0, 10)} ${date.substring(11, 20)}");
  dateDateTime = dateDateTime.toLocal();
  if (dateDateTime.day < 10) {
    return "0${dateDateTime.day}/${dateDateTime.month}";
  } else if (dateDateTime.month < 10) {
    return "${dateDateTime.day}/${dateDateTime.month}";
  } else if (dateDateTime.minute == 0) {
    return "${dateDateTime.day}/${dateDateTime.month}";
  } else {
    return "${dateDateTime.day}/${dateDateTime.month}";
  }
}

String getTime(String date) {
  var dateDateTime =
      DateTime.parse("${date.substring(0, 10)} ${date.substring(11, 20)}");
  dateDateTime = dateDateTime.toLocal();
  if (dateDateTime.minute == 0) {
    return "${dateDateTime.hour}:${dateDateTime.minute}0";
  }
  return "${dateDateTime.hour}:${dateDateTime.minute}";
}
