// Template for the questions
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnkiTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Text("ANKI QUESTIONS"),
        ),
        Expanded(child: Text("PUT QUESTION HERE")),
        Expanded(
          child: Row(children: [
            FlatButton(
              onPressed: () {},
              child:
                  Text("Correct Option, Lead to either next question or leave"),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                  "Wrong Option, Lead to either next question or to page of correct answer"),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                  "Wrong Option, Lead to either next question or to page of correct answer"),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                  "Wrong Option, Lead to either next question or to page of correct answer"),
            )
          ]),
        )
      ],
    );
  }
}
