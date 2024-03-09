import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:masterwordle/widgets/alerts/show_alerts.dart';

class MasterWordleModel extends ChangeNotifier {
  DateTime now = DateTime.now();

  final wordMaxLength = 4;
  final maxAttempts = 8;

  bool _showInvalidWord = false;

  final List<String> _attemptedWords = ["", "", "", "", "", "", "", ""];
  final List<List<int>> _scores = [
    [-1, -1],
    [-1, -1],
    [-1, -1],
    [-1, -1],
    [-1, -1],
    [-1, -1],
    [-1, -1],
    [-1, -1]
  ];

  List<String> _validWords = [];

  int _currentWord = 0;
  int _currentLetter = 0;
  String _answer = "";
  bool _complete = false;
  bool _won = false;

  bool get showInvalidWord => _showInvalidWord;
  int get currentWord => _currentWord;
  int get currentLetter => _currentLetter;
  String get answer => _answer;
  bool get complete => _complete;
  bool get won => _won;
  List<List<int>> get scores => _scores;

  String boardSquareLetter(int row, column) {
    final word = _attemptedWords[row];
    final letter = (word.length <= column) ? "" : word[column];
    return letter;
  }

  void letterTyped(String letter) {
    if (_attemptedWords[currentWord].length >= wordMaxLength) {
      return;
    } else {
      _attemptedWords[currentWord] = "${_attemptedWords[currentWord]}$letter";
      _currentLetter = _currentLetter + 1;
      notifyListeners();
    }
  }

  bool handleEnter() {
    // Check if 4 letters have been entered
    if (_attemptedWords[currentWord].length >= wordMaxLength) {
      // Check if user has rows left to guess with
      if (_currentWord < maxAttempts) {
        // Checks if correct guess
        if (_attemptedWords[currentWord] == _answer) {
          scoreWord(_attemptedWords[currentWord]);
          _currentWord = 100;
          _currentLetter = 100;
          _complete = true;
          _won = true;
          notifyListeners();
          // Checks if valid word
        } else if (checkValidWord(_attemptedWords[currentWord])) {
          scoreWord(_attemptedWords[currentWord]);
          _currentWord = _currentWord + 1;
          _currentLetter = 0;
          notifyListeners();
          // Otherwise, must be invalid
        } else {
          _showInvalidWord = true;
          notifyListeners();
          Future.delayed(const Duration(seconds: 2)).whenComplete(() {
            _showInvalidWord = false;
            notifyListeners();
          });
        }
      }
      if (_currentWord == maxAttempts) {
        _complete = true;
        notifyListeners();
      }
    }
    return _complete;
  }

  void handleDelete() {
    if (_attemptedWords[currentWord] == "") {
      return;
    } else {
      _attemptedWords[currentWord] = _attemptedWords[currentWord]
          .substring(0, _attemptedWords[currentWord].length - 1);
      _currentLetter = _currentLetter - 1;
      notifyListeners();
    }
  }

  bool checkValidWord(String word) {
    return _validWords.contains(word);
  }

  void scoreWord(String word) {
    int greenScore = 0;
    int yellowScore = 0;
    Set<int> usedIndices = {};

    for (int i = 0; i < wordMaxLength; i++) {
      if (word[i] == _answer[i]) {
        greenScore++;
        usedIndices.add(i);
      }
    }

    for (int i = 0; i < wordMaxLength; i++) {
      if (_answer.contains(word[i]) &&
          !usedIndices.contains(_answer.indexOf(word[i]))) {
        yellowScore++;
        usedIndices.add(_answer.indexOf(word[i]));
      }
    }
    _scores[currentWord] = [yellowScore, greenScore];
  }

  void populateValidWords() async {
    String data = await rootBundle.loadString('assets/allwords.txt');
    _validWords = data.split('\n');

    String rawJson = await rootBundle.loadString('assets/wordsgenerated.json');
    Map<String, dynamic> jsonData = jsonDecode(rawJson);
    String formattedMonth = now.month.toString().padLeft(2, '0');
    String formattedDay = now.day.toString().padLeft(2, '0');
    String formattedDate = "$formattedMonth/$formattedDay/${now.year}";
    List<dynamic> words = jsonData['words'];
    for (var wordEntry in words) {
      String date = wordEntry['date'];
      if (date == formattedDate) {
        _answer = wordEntry['word'];
      }
    }
  }

  (String, String, AlertType) getAlertData() {
    String extra = "";
    if (now.year == 2024 && now.month == 3 && now.day == 10) {
      extra =
          "Todays word is dedicated to the Best Mum Ever. Happy Mothers Day Mum!";
    }

    if (_won) {
      return (
        "Congratulations",
        "You have completed the MasterWordle for today. Share your result with your friends. $extra",
        AlertType.success
      );
    } else {
      return (
        "Bad Luck",
        "You ran out of guesses. The word today was '$_answer'. $extra",
        AlertType.error
      );
    }
  }

  String getShareMessage() {
    StringBuffer buffer = StringBuffer();
    buffer.writeln('MasterWordle');

    DateTime may23rd2023 = DateTime(2023, 5, 23);
    int dayNumber = now.difference(may23rd2023).inDays;

    int attempts = 0;
    StringBuffer tableBuffer = StringBuffer();
    for (int i = 0; i < scores.length; i++) {
      List<int> score = scores[i];
      if (score[0] == -1 && score[1] == -1) {
        break;
      }
      attempts++;
      String formattedScore = '${score[0]}🟡 ${score[1]}🟢';
      tableBuffer.writeln(formattedScore);
    }

    buffer.writeln('Day $dayNumber, ${_won ? attempts : '-'}/8');
    buffer.writeln();
    buffer.writeln(tableBuffer);

    return buffer.toString();
  }
}
