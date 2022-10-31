import 'package:canario_fut/controllers/home_controller.dart';
import 'package:canario_fut/controllers/state_enum.dart';
import 'package:canario_fut/models/ratingTable.dart';
import 'package:flutter/material.dart';

import 'card_team.dart';

class Ranking extends StatefulWidget {
  const Ranking({Key? key}) : super(key: key);

  @override
  State<Ranking> createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  final controller = HomeController();

  _success() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 20),
      child: ListView.builder(
        itemCount: controller.allTeams.length,
        itemBuilder: (context, index) {
          RatingTable team = controller.allTeams[index];
          return CardTeam(team: team);
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
