import 'package:canario_fut/models/matches.dart';
import 'package:canario_fut/repositories/matches_repository.dart';
import 'package:flutter/material.dart';

import 'state_enum.dart';

class MatchesController {
  List<Matches> matches = [];
  final MatchesRepository? _repository;

  var state = ValueNotifier<StateEnum>(StateEnum.start);

  MatchesController({MatchesRepository? repository})
      : _repository = repository ?? MatchesRepository();

  Future start() async {
    state.value = StateEnum.loading;
    try {
      matches = await _repository?.fetchMatches() as List<Matches>;
      state.value = StateEnum.success;
    } catch (e) {
      state.value = StateEnum.error;
    }
  }
}
