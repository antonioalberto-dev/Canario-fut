import 'package:canario_fut/repositories/team_repository.dart';

import '../models/RatingTable.dart';

class HomeController {
  List<RatingTable> allTeams = [];
  final TeamRepository? _repository;

  HomeController({TeamRepository? repository})
      : _repository = repository ?? TeamRepository();

  Future start() async {
    allTeams = await _repository?.fetchTeams();
  }
}

enum HomeState { start, loading, success, error }
