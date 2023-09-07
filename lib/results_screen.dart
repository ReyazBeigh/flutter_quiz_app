import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  final void Function() switchScreen;
  const ResultsScreen(this.switchScreen,
      {super.key, required this.choosenAnswers});
  final List<String> choosenAnswers;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'user_answer': choosenAnswers[i],
        'correct_answer': questions[i].answers[0]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarData = getSummaryData();
    final correctAnswer = summarData.where((summary) {
      return summary['user_answer'] == summary['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswer out of ${questions.length} questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(215, 19, 19, 18),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            QuestionsSummary(
              summaryData: getSummaryData(),
            ),
            TextButton.icon(
              onPressed: () {
                switchScreen();
              },
              label: const Text(
                "Restart text",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              icon: const Icon(
                Icons.refresh,
              ),
            )
          ],
        ),
      ),
    );
  }
}
