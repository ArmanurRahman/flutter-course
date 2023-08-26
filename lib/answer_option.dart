import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {
  final String text;
  final void Function(String ans) onTab;
  const AnswerOption({super.key, required this.text, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTab(text),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
