import 'package:essay_checker/components/navbar.dart';
import 'package:essay_checker/models/assessment.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ViewResult extends StatefulWidget {
  final Assessment result;

  const ViewResult({this.result});

  @override
  _ViewResultState createState() => _ViewResultState();
}

class _ViewResultState extends State<ViewResult> {
  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          NavBar(),
          Container(
            height: deviceData.height,
            width: deviceData.width,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 36.0, horizontal: 70.0),
                    child: Text(
                      'Result',
                      style: kH1TextStyle.copyWith(fontSize: 24.0),
                    ),
                  ),
                  Container(
                    color: Colors.grey[200],
                    width: 0.5 * deviceData.width,
                    height: 0.2 * deviceData.height,
                    child: Row(children: <Widget>[
                      CircleAvatar(
                        child: Text('${widget.result.result}!'),
                        radius: 32.0,
                      ),
                    ]),
                  ),
                  Container(
                    color: Colors.grey[200],
                    width: 0.5 * deviceData.width,
                    height: 0.6 * deviceData.height,
                    child: Text('result'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
