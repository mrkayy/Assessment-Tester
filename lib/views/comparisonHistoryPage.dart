import 'package:flutter/material.dart';

import '../components/navbar.dart';

class ComparisonHistoryPage extends StatefulWidget {
  static String id = '/history';
  @override
  _ComparisonHistoryPageState createState() => _ComparisonHistoryPageState();
}

class _ComparisonHistoryPageState extends State<ComparisonHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (BuildContext context, constrain) {
            return Container(
              child: Column(children: <Widget>[
                NavBar(),
                // Sections(),
              ]),
            );
          },
        ),
      ),
    );
  }
}
