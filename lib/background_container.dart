import 'package:flutter/material.dart';
import 'package:quiz_app/landing_screen.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class BackgroundContainer extends StatelessWidget {
  final Color color1;
  final Color color2;

  const BackgroundContainer(this.color1, this.color2, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Text('test'),
    );
  }
}
