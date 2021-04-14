import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Which is the correct formula for Pideal?',
      'answers': [
        {'text': 'Pspindle + Phead + Pother', 'score': 0},
        {'text': 'Pfullspeed + Phead + Pother', 'score': 0},
        {'text': 'Pfullspeed + Pother', 'score': 10},
        {'text': 'None of these', 'score': 0},
      ],
    },
    {
      'questionText':
          'Who is responsible for regulating operations of telecommunication network in India?',
      'answers': [
        {'text': 'EPEAT', 'score': 0},
        {'text': 'TRAI', 'score': 10},
        {'text': 'ISO', 'score': 0},
        {'text': 'ZICA', 'score': 0},
      ],
    },
    {
      'questionText': 'Tactical strategy time frame is',
      'answers': [
        {'text': 'One year', 'score': 10},
        {'text': 'Two year', 'score': 0},
        {'text': 'Immediate', 'score': 0},
        {'text': 'None of these', 'score': 0},
      ],
    },
    {
      'questionText': 'SITS value curve starts with',
      'answers': [
        {'text': 'Sustainable Processes', 'score': 10},
        {'text': 'Energy efficiency & Cost Savings', 'score': 0},
        {'text': 'Strategic social responsibilities', 'score': 0},
        {'text': 'Legal Compliance', 'score': 0},
      ],
    },
    {
      'questionText':
          'Who standardizes telecommunications operation on an international basis to build a fair and R competitive environment',
      'answers': [
        {'text': 'TRAI', 'score': 0},
        {'text': 'ITU-T', 'score': 10},
        {'text': 'NGN', 'score': 0},
        {'text': 'QoS', 'score': 0},
      ],
    },
    {
      'questionText': 'Which protocol is associated with minimum of 320 bits?',
      'answers': [
        {'text': 'ICMPv4', 'score': 0},
        {'text': 'IPv6', 'score': 10},
        {'text': 'TCP', 'score': 0},
        {'text': 'RTP', 'score': 0},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    // print(_questionIndex);
    // print(_questions[_questionIndex]);
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xaaffffff),
          title: Text(
            'Quizze',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xff238c00)),
            textAlign: TextAlign.center,
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
