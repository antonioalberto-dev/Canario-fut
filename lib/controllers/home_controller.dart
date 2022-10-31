import 'package:canario_fut/controllers/state_enum.dart';
import 'package:canario_fut/repositories/team_repository.dart';
import 'package:flutter/widgets.dart';

import '../models/ratingTable.dart';

class HomeController {
  List<RatingTable> allTeams = [];
  final TeamRepository? _repository;

  var state = ValueNotifier<StateEnum>(StateEnum.start);

  HomeController({TeamRepository? repository})
      : _repository = repository ?? TeamRepository();

  Future start() async {
    state.value = StateEnum.loading;
    try {
      allTeams = await _repository?.fetchTeams() as List<RatingTable>;
      state.value = StateEnum.success;
    } catch (e) {
      state.value = StateEnum.error;
    }
  }
}
