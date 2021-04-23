import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final String question;
  final List answers;
  final Function goAhead;

  Quiz(this.question, this.answers, this.goAhead);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(question),
        ...(answers).map((answer) => Answer(answer, goAhead)).toList(),
      ],
    );
  }
}
