import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  final void Function() startQuiz;
  const StartScreen(this.startQuiz, {super.key});
  @override
  Widget build(context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      // Opacity(
      //   opacity: 0.5,
      //   child: Image.asset(
      //     "assets/images/quiz-logo.png",
      //   ),
      // ),
      Image.asset(
        "assets/images/quiz-logo.png",
        color: const Color.fromARGB(150, 255, 255, 255),
      ),
      const SizedBox(
        height: 20,
      ),
      Text(
        "Learn flutter the fun way!",
        style: GoogleFonts.lato(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      ElevatedButton.icon(
          onPressed: startQuiz,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          label: const Text("Start Quiz"),
          icon: const Icon(Icons.arrow_right_alt))
    ]);
  }
}
