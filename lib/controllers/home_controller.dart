import 'package:canario_fut/repositories/team_repository.dart';
import 'package:flutter/widgets.dart';

import '../models/RatingTable.dart';

class HomeController {
  List<RatingTable> allTeams = [];
  final TeamRepository? _repository;

  var state = ValueNotifier<HomeState>(HomeState.start);

  HomeController({TeamRepository? repository})
      : _repository = repository ?? TeamRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      allTeams =  await _repository?.fetchTeams() as List<RatingTable>;
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
