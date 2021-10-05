import 'package:dementia_app_support/features/presentation/widgets/webViewContainer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show TargetPlatform;

import '../helpPage.dart';

class MyMemories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const url = "https://dst.webtrax.com.au/dst_test_memoir/";
    const mdbookURL = "http://localhost:3000/";
    return Scaffold(
      appBar: AppBar(
        title: Text('My Memories'),
      ),
      body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: <Widget>[
            RaisedButton(
                padding: const EdgeInsets.all(8),
                child: const Text("Read Memories"),
                color: Colors.lightGreen[400],
                onPressed: () {
                  if (Theme.of(context).platform == TargetPlatform.windows) {
                    _launchURL(mdbookURL);
                  } else if (Theme.of(context).platform ==
                      TargetPlatform.android) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WebViewContainer(mdbookURL, 'Memoir')),
                    );
                  }
                }),
            RaisedButton(
              padding: const EdgeInsets.all(8),
              child: const Text('Write Memories'),
              color: Colors.lightBlue[400],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WriteMyMemories()),
                );
              },
            ),
            RaisedButton(
              padding: const EdgeInsets.all(8),
              child: const Text('Record Memories'),
              color: Colors.orange[400],
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ]),
    );
  }
}

class WriteMyMemories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Record Your Memories'),
        ),
        body: MyLayout());
  }
}

class MyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              child: Text("Normal Alert,"),
              onPressed: () {
                showAlertDialog(context);
              }),
          RaisedButton(
            child: Text("Timed Alert"),
            onPressed: () async {
              await Future.delayed(Duration(seconds: 5));
              showAlertDialogTimer(context);
            },
          ),
          RaisedButton(
            child: Text("Empty Alert"),
            onPressed: () {
              showAlertDialogEmpty(context);
            },
          ),
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget yesButton = FlatButton(
    child: Text("Yes"),
    onPressed: () {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HelpPage()),
      );
    },
  );
  Widget noButton = FlatButton(
    child: Text("No"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Do you need some Help?"),
    content: Text(
        "Hey nothings happened for abit, would you like some help?\n Press 'Yes' for some help, otherwise press 'No' if you're fine."),
    actions: [
      yesButton,
      noButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogTimer(BuildContext context) {
  // set up the button
  Widget yesButton = FlatButton(
    child: Text("Yes"),
    onPressed: () {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HelpPage()),
      );
    },
  );
  Widget noButton = FlatButton(
    child: Text("No"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Do you need some Help?"),
    content: Text(
        "Hey nothings happened for abit, would you like some help?\n Press 'Yes' for some help, otherwise press 'No' if you're fine."),
    actions: [
      yesButton,
      noButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogEmpty(BuildContext context) {
  // set up the button
  Widget yesButton = FlatButton(
    child: Text("Yes"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Do you need some Help?"),
    content: Text(""),
    actions: [
      yesButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}
