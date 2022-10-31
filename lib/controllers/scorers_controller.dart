
import 'package:canario_fut/models/scorer.dart';
import 'package:canario_fut/repositories/scorers_repository.dart';
import 'package:flutter/material.dart';

import 'state_enum.dart';

class ScorersController {
  List<Scorer> scorers = [];
  final ScorersRepository? _repository;

  var state = ValueNotifier<StateEnum>(StateEnum.start);

  ScorersController({ScorersRepository? repository})
      : _repository = repository ?? ScorersRepository();

  Future start() async {
    state.value = StateEnum.loading;
    try {
      scorers = await _repository?.fetchScorers() as List<Scorer>;
      state.value = StateEnum.success;
    } catch (e) {
      state.value = StateEnum.error;
    }
  }
}