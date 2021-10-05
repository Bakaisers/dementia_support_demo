// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart' show TargetPlatform;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'features/presentation/widgets/menuButtons.dart';
import 'features/presentation/widgets/webViewContainer.dart';

// const url = '../../../../../assets/anki_web_test_pages/PT.1a.html';

bool isStopped = false; //global
const url = "https://dst.webtrax.com.au/dst_test_memoir/";
const mdBookUrl = "http://localhost:3000/";

//Intitialize Button values

void main() {
// it should be the first line in main method
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };
  runApp(MaterialApp(
    title: 'Dashboard',
    home: Dashboard(),
  ));
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hello There (Insert User\'s name)'),
        ),
        body: MenuButtons());
  }
}
