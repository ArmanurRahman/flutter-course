import 'package:flutter/material.dart';
import 'package:quiz_app/background_container.dart';
import 'package:quiz_app/landing_screen.dart';
import 'package:quiz_app/questions_screen.dart';

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
      screen = const QuestionsScreen();
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
