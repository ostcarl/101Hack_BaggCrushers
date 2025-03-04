import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:risk_companion/main.dart';
import 'package:risk_companion/models/LFRisk.dart';
import 'package:risk_companion/models/Weather.dart';
import 'package:risk_companion/services/apiService.dart';

void main() {
  ApiService apiService = ApiService.instance;

  test('Risk http call works.', () async {

    LFRisk risk = await apiService.getAccidentRisk({});

    print(risk.percentile);
    print(risk.score);
  });

  test('Risk route http call works.', () async {

    LFRisk risk = await apiService.getAccidentRiskFromDestinations("Lindholmen", "Ängelholm", {});

    print(risk.percentile);
    print(risk.score);
  });

  test('Weather http call works', () async {

    Weather weather = await apiService.getWeatherFromPoint(57.708320, 11.937907, DateTime.now());

    print(weather);

  });
}
