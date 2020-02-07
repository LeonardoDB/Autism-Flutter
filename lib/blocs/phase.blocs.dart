import 'dart:async' show Future;
import 'package:Autismo/models/phase.model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

Future<String> _loadPhaseAsset(idPhase) async {
  return await rootBundle.loadString('assets/json/phase_$idPhase.json');
}

Future loadPhase(idPhase) async {
  String jsonPhase = await _loadPhaseAsset(idPhase);
  final jsonResponse = json.decode(jsonPhase);
  PhaseModel phase = new PhaseModel.fromJson(jsonResponse);
  // print(phase.images[0].imagePlacePath);
  return phase;
}
