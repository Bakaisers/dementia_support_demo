import 'package:flutter/material.dart';
// import 'package:universal_html/html.dart';

class WriteMyMemories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Record Your Memories'),
      ),
    );
  }
}

class WriteMemories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Text('Add to your memories'),
        ),
        Container(
          child: TextFormField(
            decoration: InputDecoration(labelText: 'Add to your memories'),
          ),
        ),
      ],
    );
  }
}
