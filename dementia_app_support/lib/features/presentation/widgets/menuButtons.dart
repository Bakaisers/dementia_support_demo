import 'package:dementia_app_support/features/presentation/pages/ankiQuestion.dart';
import 'package:dementia_app_support/features/presentation/pages/helpPage.dart';
import 'package:dementia_app_support/features/presentation/pages/myMemories/writeMyMemories.dart';
import 'package:dementia_app_support/features/presentation/widgets/webViewContainer.dart';
import 'package:dementia_app_support/main.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

class MenuButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          height: SizeConfig.blockSizeVertical * 78,
          width: SizeConfig.blockSizeHorizontal * 35,
          child: new RaisedButton.icon(
              padding: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              color: Colors.lightGreen[400],
              label: Text(
                'Read Memories',
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              icon: Icon(
                Icons.home,
                color: Colors.black,
                size: 20,
              ),
              onPressed: () {
                if (Theme.of(context).platform == TargetPlatform.windows) {
                  _launchURL(url);
                } else if (Theme.of(context).platform ==
                    TargetPlatform.android) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WebViewContainer(url, 'Memoir')),
                  );
                }
              }),
        ),
        Container(
          height: SizeConfig.blockSizeVertical * 78,
          width: SizeConfig.blockSizeHorizontal * 35,
          child: new RaisedButton.icon(
            padding: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            color: Colors.purple[200],
            label: Text(
              'Listen to Memories',
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
            icon: Icon(
              Icons.home,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WriteMyMemories()),
              );
            },
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: SizeConfig.blockSizeVertical * 37,
              width: SizeConfig.blockSizeHorizontal * 25,
              child: new RaisedButton.icon(
                padding: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                color: Colors.lightBlue[200],
                label: Text(
                  'Anki Questions',
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AnkiQuestions()),
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildAboutDialog(context),
                  );
                },
              ),
            ),
            Container(
              height: SizeConfig.blockSizeVertical * 37,
              width: SizeConfig.blockSizeHorizontal * 25,
              child: new RaisedButton.icon(
                padding: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                color: Colors.yellow[200],
                label: Text(
                  'Help',
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget _buildAboutDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Do you know the answer?'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildAboutText(),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Okay, got it!'),
      ),
      new FlatButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => MyMemories()),
          // );
          if (Theme.of(context).platform == TargetPlatform.windows) {
            _launchURL(url);
          } else if (Theme.of(context).platform == TargetPlatform.android) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WebViewContainer(url, 'Memoir')),
            );
          }
          // input something that can create some hint for the user
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('No, I dont understand!'),
      ),
    ],
  );
}

const TextStyle linkStyle = const TextStyle(
  color: Colors.blue,
  decoration: TextDecoration.underline,
);

Widget _buildAboutText() {
  return new RichText(
    text: new TextSpan(
      text: 'If you need help, click on the \'No, I dont understand\'.\n\n',
      style: const TextStyle(color: Colors.black87),
      children: <TextSpan>[
        const TextSpan(text: 'Else click on \'Okay, I got it\'. '),
      ],
    ),
  );
}

// ignore: unused_element
_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}
