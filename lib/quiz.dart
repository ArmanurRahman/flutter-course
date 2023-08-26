import 'package:flutter/material.dart';
import 'package:quiz_app/background_container.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/landing_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  // Widget? activeScreen;
  var activeScreen = 'landing-screen';

  List<String> selectedAnswers = [];

  void onSelectAnswer(String ans) {
    selectedAnswers.add(ans);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void onRestart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  void initState() {
    // activeScreen = LandingScreen(switchScreen);
    // activeScreen = 'question-screen';
    super.initState();
  }

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = LandingScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      screen = QuestionsScreen(onSelectAnswer: onSelectAnswer);
    } else if (activeScreen == 'result-screen') {
      screen = ResultScreen(
        chosenAnswers: selectedAnswers,
        onRestart: onRestart,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 33, 5, 109),
                Color.fromARGB(255, 68, 21, 149)
              ],
              begin: startAlignment,
              end: endAlignment,
            ),
          ),
          child: screen,
        ),
      ),
    );
  }
}
