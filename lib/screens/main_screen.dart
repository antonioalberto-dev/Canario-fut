import 'package:canario_fut/controllers/home_controller.dart';
import 'package:canario_fut/models/RatingTable.dart';
import 'package:canario_fut/repositories/team_repository.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller = HomeController();

  _success() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,15,10,20),
      child: ListView.builder(
        itemCount: controller.allTeams.length,
        itemBuilder: (context, index) {
          RatingTable team = controller.allTeams[index];
          return Card(
            color: colorCard(team.position),
            margin: const EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
            elevation: 2,
            child: ListTile(
              leading: Text(team.position.toString(), style: const TextStyle(fontSize: 12),),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(team.team!.shortName.toString(), style: const TextStyle(fontSize: 12),),
                  Text(team.points.toString(), style: const TextStyle(fontSize: 12),),
                ],
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

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.error:
        return _error();
      case HomeState.success:
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
    return Scaffold(
      // backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        title: const Text('Canario'),
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }
}

Color? colorCard(int? position) {
  if (position! <= 4 ) {
    return Colors.green[200];
  }else if(position >= 17){
    return Colors.red[200];
  }else if(position <= 6){
    return Colors.orangeAccent[200];
  }
}
