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
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
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
            height: MediaQuery.of(context).size.height * .70,
            child: GridView.builder(
              padding: const EdgeInsets.only(left: 10, right: 10),
              itemCount: controller.matches.length,
              itemBuilder: (context, index) {
                Matches match = controller.matches[index];
                return Card(
                  elevation: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(match.homeTeam!.tla.toString()),
                          Text(match.score!.fullTime!.home.toString())
                        ],
                      ),
                      const Divider(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(match.awayTeam!.tla.toString()),
                          Text(match.score!.fullTime!.away.toString())
                        ],
                      ),
                    ],
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 5/3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        child: const Text('Tentar novamente'),
        onPressed: () {
          controller.start();
        },
      ),
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
