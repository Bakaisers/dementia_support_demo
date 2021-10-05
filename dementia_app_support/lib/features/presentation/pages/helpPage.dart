import 'package:dementia_app_support/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'ankiQuestion.dart';

// class HelpPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Help Page'),
//       ),
//     );
//   }
// }

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Page'),
      ),
      body: TextPage(),
    );
  }
}

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TapGestureRecognizer _gestureRecognizerDashboard =
        TapGestureRecognizer()
          ..onTap = () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
            );
          };
    final TapGestureRecognizer _gestureRecognizerPage = TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AnkiQuestions()),
        );
      };

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
              Expanded(
                  child: RichText(
                      text: TextSpan(
                          text: "Help and Support",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          )))),
              Expanded(
                  child: RichText(
                      text: TextSpan(
                          text:
                              "Click the blue Dashboard to go back to start. ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                          ),
                          children: [
                    TextSpan(
                        text: "Dashboard",
                        style: TextStyle(color: Colors.blue),
                        recognizer: _gestureRecognizerDashboard),
                  ]))),
              Expanded(
                  child: RichText(
                      text: TextSpan(
                          text: "Click The Blue Word to go to page. ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                          ),
                          children: [
                    TextSpan(
                        text:
                            "Read Memories(Gotta fix this to lead to the memoir)",
                        style: TextStyle(color: Colors.blue),
                        recognizer: _gestureRecognizerPage),
                  ]))),
              Expanded(
                  child: RichText(
                      text: TextSpan(
                          text:
                              '''Anki Help \nThe process for the Anki question 
                              is continuous till you quit. This will lead back 
                              to the dashboard. \nIf you want to continue, 
                              you would click Next Question''',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                          ),
                          children: [
                            TextSpan(
                                text: "Dashboard",
                                style: TextStyle(color: Colors.blue),
                                recognizer: _gestureRecognizerDashboard),
                          ]))),
            ]))));
  }
}
