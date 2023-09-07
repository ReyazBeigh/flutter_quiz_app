import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionsSummary({super.key, required this.summaryData});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((summary) {
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
                      color: summary['user_answer'] == summary['correct_answer']
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          summary['question'].toString(),
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(171, 255, 255, 255),
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          summary['user_answer'].toString(),
                          style: GoogleFonts.lato(
                            color: userAnswer,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          summary['correct_answer'].toString(),
                          style: GoogleFonts.lato(
                            color: answer,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
