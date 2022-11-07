import 'package:canario_fut/controllers/scorers_controller.dart';
import 'package:canario_fut/models/scorer.dart';
import 'package:flutter/material.dart';

import '../controllers/state_enum.dart';

class ScorersScreen extends StatefulWidget {
  const ScorersScreen({Key? key}) : super(key: key);

  @override
  State<ScorersScreen> createState() => _ScorersScreenState();
}

class _ScorersScreenState extends State<ScorersScreen> {
  final controller = ScorersController();
  _success() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 20),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 50,
                child: Image(
                  image: NetworkImage(controller.info['emblem']),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ARTILHEIROS',
                      style: TextStyle(
                        fontSize: 16,
                        // letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${controller.info['name']}',
                      style: const TextStyle(
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
            child: ListView.builder(
              itemCount: controller.scorers.length,
              itemBuilder: (context, index) {
                Scorer scorer = controller.scorers[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white, colorScorerBG(index)],
                      ),
                    ),
                    child: ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            scorer.goals.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            "Gols".toUpperCase(),
                            style: TextStyle(
                                fontSize: 10,
                                color: colorScorerText(index),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.3),
                          ),
                        ],
                      ),
                      title: Text(scorer.player!.name.toString()),
                      subtitle: Text(
                        scorer.team!.name.toString(),
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ),
                );
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
          'Não foi possível carregar a artilharia',
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

Color colorScorerText(int position) {
  if (position == 0) {
    return Colors.amber;
  } else if (position == 1) {
    return Colors.grey;
  } else if (position == 2) {
    return Colors.brown;
  }
  return Colors.black87;
}

Color colorScorerBG(int position) {
  if (position == 0) {
    return Colors.amber;
  } else if (position == 1) {
    return Colors.grey;
  } else if (position == 2) {
    return Colors.brown;
  }
  return Colors.white;
}
