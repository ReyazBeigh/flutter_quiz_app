import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionsSummary({super.key, required this.summaryData});
  @override
  Widget build(BuildContext context) {
    throw SizedBox(
      height: 300,
      child: Column(
        children: summaryData.map((summary) {
          return Row(
            children: [
              Text(((summary['question_index'] as int) + 1).toString()),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      summary['question'].toString(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      summary['user_answer'].toString(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      summary['correct_answer'].toString(),
                    ),
                  ],
                ),
              )
            ],
          );
        }).toList(),
      ),
    );
  }
}
