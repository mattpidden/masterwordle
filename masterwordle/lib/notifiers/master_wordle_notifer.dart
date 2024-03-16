import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:masterwordle/widgets/alerts/show_alerts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MasterWordleModel extends ChangeNotifier {
  MasterWordleModel() {
    getData();
  }

  DateTime now = DateTime.now();
  final wordMaxLength = 4;
  final maxAttempts = 8;

  bool _showInvalidWord = false;

  List<String> _attemptedWords = ["", "", "", "", "", "", "", ""];
  List<List<int>> _scores = [
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
  DateTime get date => now;

  void resetPage() {
    now = DateTime.now();
    _showInvalidWord = false;
    _attemptedWords = ["", "", "", "", "", "", "", ""];
    _scores = [
      [-1, -1],
      [-1, -1],
      [-1, -1],
      [-1, -1],
      [-1, -1],
      [-1, -1],
      [-1, -1],
      [-1, -1]
    ];
    _validWords = [];
    _currentWord = 0;
    _currentLetter = 0;
    _answer = "";
    _complete = false;
    _won = false;
    populateValidWords();
    getData();
    notifyListeners();
  }

  String boardSquareLetter(int row, column) {
    final word = _attemptedWords[row];
    final letter = (word.length <= column) ? "" : word[column];
    return letter;
  }

  bool rowComplete(int row) {
    int currentWord = (_currentWord < maxAttempts) ? _currentWord : maxAttempts;
    return (row < currentWord);
  }

  bool letterUsed(String letter) {
    int currentWord = (_currentWord < maxAttempts) ? _currentWord : maxAttempts;
    for (var index = 0; index < currentWord; index++) {
      if (_attemptedWords[index].contains(letter)) {
        return true;
      }
    }
    return false;
  }

  void letterTyped(String letter) {
    if (_attemptedWords[currentWord].length >= wordMaxLength) {
      return;
    } else {
      _attemptedWords[currentWord] = "${_attemptedWords[currentWord]}$letter";
      _currentLetter = _currentLetter + 1;
      saveData();
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
          _currentWord = _currentWord + 1;
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
    saveData();
    return _complete;
  }

  void handleDelete() {
    if (_attemptedWords[currentWord] == "") {
      return;
    } else {
      _attemptedWords[currentWord] = _attemptedWords[currentWord].substring(0, _attemptedWords[currentWord].length - 1);
      _currentLetter = _currentLetter - 1;
      notifyListeners();
      saveData();
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
      if (_answer.contains(word[i]) && !usedIndices.contains(_answer.indexOf(word[i]))) {
        yellowScore++;
        usedIndices.add(_answer.indexOf(word[i]));
      }
    }
    _scores[currentWord] = [yellowScore, greenScore];
    saveData();
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
    if (now.month == 3 && now.day == 20) {
      extra = "Happy Birthday to the coolest app developer.";
    } else if (now.month == 3 && now.day == 29) {
      extra = "Happy Birthday to Tom!";
    } else if (now.month == 5 && now.day == 7) {
      extra = "Happy Birthday to Dad!";
    } else if (now.month == 5 && now.day == 14) {
      extra = "Happy Birthday to Sela!";
    } else if (now.month == 6 && now.day == 5) {
      extra = "Happy Birthday to MastterGame's most frequent user!";
    } else if (now.month == 11 && now.day == 11) {
      extra = "Happy Birthday to Ollie!";
    } else if (now.month == 12 && now.day == 25) {
      extra = "Merry Christmas Everyone!";
    } else if (now.month == 12 && now.day == 31) {
      extra = "Happy New Year's Eve!";
    } else if (now.month == 1 && now.day == 1) {
      extra = "Happy New Years!";
    }

    if (_won) {
      return ("Congratulations", "You have completed the MasterWordle for today. Share your result with your friends. $extra", AlertType.success);
    } else {
      return ("Bad Luck", "You ran out of guesses. The word today was '$_answer'. $extra", AlertType.error);
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
    buffer.writeln("https://t.ly/b7lCg");

    return buffer.toString();
  }

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime now = DateTime.now();

    Map<String, dynamic> jsonData = {
      'date': now.toIso8601String(),
      'words': _attemptedWords,
      'scores': scores.map((list) => list.map((e) => e).toList()).toList(),
      'current_letter': _currentLetter,
      'current_word': _currentWord,
      'complete': _complete,
      'won': _won,
    };

    String jsonString = json.encode(jsonData);
    await prefs.setString('masterwordle', jsonString);
  }

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedData = prefs.getString('masterwordle');
    DateTime now = DateTime.now();

    if (savedData != null) {
      Map<String, dynamic> jsonData = json.decode(savedData);
      DateTime savedDate = DateTime.parse(jsonData['date']);

      if (savedDate.year == now.year && savedDate.month == now.month && savedDate.day == now.day) {
        _attemptedWords = List<String>.from(jsonData['words']);
        List<dynamic> scoreLists = jsonData['scores'];
        _scores = scoreLists.map<List<int>>((list) {
          return List<int>.from(list);
        }).toList();
        _currentLetter = jsonData['current_letter'];
        _currentWord = jsonData['current_word'];
        _complete = jsonData['complete'];
        _won = jsonData['won'];
        notifyListeners();
      }
    }
  }
}
