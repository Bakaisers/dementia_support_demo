import 'package:flutter/material.dart';

import '../../../main.dart';
import 'ankiQuestion.dart';

class RightAnswer extends StatefulWidget {
  @override
  _RightAnswerState createState() => _RightAnswerState();
}

class _RightAnswerState extends State<RightAnswer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: Text('Yay, you are correct')),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Next Question',
                  style: TextStyle(fontSize: 40),
                ),
                color: Colors.lightBlueAccent[400],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AnkiQuestions()),
                  );
                }),
            RaisedButton(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Go Back to Dashboard',
                  style: TextStyle(fontSize: 40),
                ),
                color: Colors.lightGreen[400],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
                }),
          ],
        ))
      ],
    );
  }
}
