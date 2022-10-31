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
      child: ListView.builder(
        itemCount: controller.scorers.length,
        itemBuilder: (context, index) {
          Scorer scorer = controller.scorers[index];
          return Card(
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
                    style: const TextStyle(fontSize: 8, color: Colors.amber, fontWeight: FontWeight.bold, letterSpacing: 1.3),
                  ),
                ],
              ),
              title: Text(scorer.player!.name.toString()),
              subtitle: Text(
                scorer.team!.name.toString(),
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black45,
                ),
              ),
            ),
          );
        },
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