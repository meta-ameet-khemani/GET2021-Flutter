import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int questionIndex = 0;
  bool showResult = false;
  int totalMarks = 0;
  final List questionsAnswers = [
    {
      'question': 'Who won first IPL ?',
      'answers': [
        {'option': 'CSK', 'marks': 0},
        {'option': 'RCB', 'marks': 0},
        {'option': 'KKR', 'marks': 0},
        {'option': 'RR', 'marks': 10}
      ]
    },
    {
      'question': 'Who made first century ?',
      'answers': [
        {'option': 'Dhoni', 'marks': 0},
        {'option': 'Manish Pandey', 'marks': 0},
        {'option': 'Mecculum', 'marks': 10},
        {'option': 'Hayden', 'marks': 0}
      ]
    },
    {
      'question': 'Whom againt sachin made first ODI 200 ?',
      'answers': [
        {'option': 'Pakistan', 'marks': 0},
        {'option': 'Australia', 'marks': 0},
        {'option': 'Srilanka', 'marks': 0},
        {'option': 'South Africa', 'marks': 10}
      ]
    }
  ];

  void goAhead(int marks) {
    setState(() {
      totalMarks += marks;
      if (questionIndex < questionsAnswers.length - 1) {
        questionIndex++;
      } else {
        showResult = true;
      }
    });
  }

  void reset() {
    setState(() {
      totalMarks = 0;
      questionIndex = 0;
      showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: Center(
          child: Scaffold(
            body: Center(
              child: !showResult
                  ? Quiz(questionsAnswers[questionIndex]['question'],
                      questionsAnswers[questionIndex]['answers'], goAhead)
                  : Result(totalMarks, reset),
            ),
          ),
        ),
      ),
    );
  }
}
