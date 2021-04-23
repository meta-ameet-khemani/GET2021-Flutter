import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Map<String, Object> answer;
  final Function goAhead;

  Answer(this.answer, this.goAhead);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => goAhead(answer['marks']),
      child: Text(
        answer['option'],
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
