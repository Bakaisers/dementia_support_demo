import 'dart:convert';
import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:universal_html/driver.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'correct.dart';
import 'wrong.dart';

//Intitialize Button values
class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}

class AnkiQuestions extends StatefulWidget {
  @override
  _AnkiQuestionsState createState() => _AnkiQuestionsState();
}

class _AnkiQuestionsState extends State<AnkiQuestions> {
  int index = new Random().nextInt(5);
  static const double paddingEdge = 20;
  static const double fontSize = 30;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
            future: readCounter(),
            builder:
                (BuildContext context, AsyncSnapshot<List<String>> myList) {
              String correctIndex = myList.data
                  .elementAt(index)
                  .split(', ')
                  .elementAt(5)
                  .toString();
              return Column(
                children: <Widget>[
                  Container(
                    child: Text(splitList(myList, index, 0)),
                  ),
                  Expanded(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: AspectRatio(
                            aspectRatio: 5 / 3,
                            child: Flex(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              direction: Axis.horizontal,
                              children: [
                                RaisedButton(
                                  padding: const EdgeInsets.all(paddingEdge),
                                  onPressed: () {
                                    correctOrWrong(
                                        context, 1, int.parse(correctIndex));
                                  },
                                  child: Text(
                                    splitList(myList, index, 1),
                                    style: TextStyle(fontSize: fontSize),
                                  ),
                                  color: Colors.lightGreen[400],
                                ),
                                RaisedButton(
                                  padding: const EdgeInsets.all(paddingEdge),
                                  onPressed: () {
                                    correctOrWrong(
                                        context, 2, int.parse(correctIndex));
                                  },
                                  child: Text(
                                    splitList(myList, index, 2),
                                    style: TextStyle(fontSize: fontSize),
                                  ),
                                  color: Colors.lightBlueAccent[400],
                                ),
                                RaisedButton(
                                  padding: const EdgeInsets.all(paddingEdge),
                                  onPressed: () {
                                    correctOrWrong(
                                        context, 3, int.parse(correctIndex));
                                  },
                                  child: Text(
                                    splitList(myList, index, 3),
                                    style: TextStyle(fontSize: fontSize),
                                  ),
                                  color: Colors.redAccent[400],
                                ),
                                RaisedButton(
                                  padding: const EdgeInsets.all(paddingEdge),
                                  onPressed: () {
                                    correctOrWrong(
                                        context, 4, int.parse(correctIndex));
                                  },
                                  child: Text(
                                    splitList(myList, index, 4),
                                    style: TextStyle(fontSize: fontSize),
                                  ),
                                  color: Colors.yellowAccent[400],
                                )
                              ],
                            ),
                          ))),
                ],
              );
            }));
  }
}

// Read file and put into a list
Future<List<String>> readCounter() async {
  String fileName = 'assets/ankiQuestionDatabase.txt';
  List<String> list = [];
  try {
    // Read the file.
    await rootBundle.loadString(fileName).then((q) {
      for (String i in LineSplitter().convert(q)) {
        list.add(i);
      }
    });
    return list;
  } catch (e) {
    // If encountering an error, return 0.
    return e;
  }
}

// Check if the answer is correct or not
void correctOrWrong(BuildContext context, int index, int correct) {
  if (index == correct) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RightAnswer()),
    );
    // return true;
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WrongAnswer()),
    );
    // return false;
  }
}

// Display whatever from txt file by splitting ', '
String splitList(
    AsyncSnapshot<List<String>> tempList, int index, int question) {
  String dat = tempList.data.elementAt(index).split(', ').elementAt(question);

  return dat;
}

class AnkiQuestionsLoadURL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const url = 'assets/anki_web_test_pages/PT.1b.html';
    return Scaffold(
      appBar: AppBar(
        title: Text("Anki Questions"),
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: url,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
            _loadHtmlFromAssets(url);
          },
        ),
      ),
    );
  }
}

// 2 Different methods to load urls or webpages
// This uses forceWebView
// ignore: unused_element
_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}

// This uses a webview controller
WebViewController _controller;

_loadHtmlFromAssets(String url) async {
  final driver = new HtmlDriver();
  String fileText = await rootBundle.loadString(url);
  //await driver.setDocumentFromUri(Uri.parse(url));
  _controller.loadUrl(Uri.dataFromString(fileText,
          mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
      .toString());
}
