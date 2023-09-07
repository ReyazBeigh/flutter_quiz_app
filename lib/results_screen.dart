import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
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
            // QuestionsSummary(
            //   summaryData: getSummaryData(),
            // ),

            SizedBox(
              height: 400,
              child: SingleChildScrollView(
                child: Column(
                  children: summarData.map((summary) {
                    const Color answer = Color.fromARGB(255, 203, 49, 134);
                    const Color userAnswer = Color.fromARGB(228, 89, 89, 205);

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: summary['user_answer'] ==
                                      summary['correct_answer']
                                  ? Colors.green
                                  : Colors.red,
                              borderRadius: BorderRadius.circular(100)),
                          child: Text(
                            ((summary['question_index'] as int) + 1).toString(),
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  summary['question'].toString(),
                                  style: GoogleFonts.lato(
                                    color: const Color.fromARGB(
                                        171, 255, 255, 255),
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  summary['user_answer'].toString(),
                                  style: GoogleFonts.lato(
                                    color: userAnswer,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  summary['correct_answer'].toString(),
                                  style: GoogleFonts.lato(
                                    color: answer,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
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
