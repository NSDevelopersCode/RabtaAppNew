import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:raabta/model/score_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Make sure to import the ScoreDate class

class TotalScore extends ChangeNotifier {
  int score = 0;
  String text = '';
  List<ScoreDate> scoresList = [];

  // Add score to the list and save it to SharedPreferences
  void addScoreToList(ScoreDate scoreToAdd) async {
    scoresList.add(scoreToAdd);
    await saveScoresToSharedPreferences();
    notifyListeners();
  }

  // Remove all scores from the list and clear SharedPreferences
  void removeScoreList() async {
    scoresList.clear();
    await clearScoresFromSharedPreferences();
    notifyListeners();
  }

  // Save scoresList to SharedPreferences
  Future<void> saveScoresToSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedScores = jsonEncode(
      scoresList.map((scoreDate) => scoreDate.toJson()).toList(),
    );
    await prefs.setString('scores_list', encodedScores);
  }

  // Load scoresList from SharedPreferences
  Future<void> loadScoresFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodedScores = prefs.getString('scores_list');

    if (encodedScores != null) {
      final List<dynamic> decodedScores = jsonDecode(encodedScores);
      scoresList = decodedScores
          .map((json) => ScoreDate.fromJson(json as Map<String, dynamic>))
          .toList();
      notifyListeners();
    }
  }

  // Clear scores from SharedPreferences
  Future<void> clearScoresFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('scores_list');
  }
}
