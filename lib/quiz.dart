import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/questions_screen.dart';
import 'package:flutter_quiz_app/results_screen.dart';
import 'package:flutter_quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start";
  List<String> selectedAnswers = [];
  void switchScreen() {
    setState(() {
      activeScreen = "questions";
      selectedAnswers = [];
    });
  }

  void addToSelectedAnswers(String answer) {
    selectedAnswers.add(answer);
    print('${selectedAnswers.length} - ${questions.length}');
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "result";
      });
    }
  }

  @override
  Widget build(context) {
    Widget screen = StartScreen(switchScreen);
    if (activeScreen == "questions") {
      screen = QuestionsScreen(onSelectAnswer: addToSelectedAnswers);
    } else if (activeScreen == "result") {
      screen = ResultsScreen(
        switchScreen,
        choosenAnswers: selectedAnswers,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple.shade400,
                Colors.purple.shade100,
                Colors.purple.shade600
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: screen,
          ),
        ),
      ),
    );
  }
}
