import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 10) {
      resultText = 'You need to study. Your score was 0.';
    } else if (resultScore <= 20) {
      resultText = 'Pretty likeable! Your score was 10.';
    } else if (resultScore <= 40) {
      resultText = 'You were almost right. Your score was 30.';
    } else {
      resultText = 'You Got all right. Your score was 50.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz!',
            ),
            textColor: Colors.black,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
