import 'package:essay_checker/models/apiResponseData.dart';
import 'package:essay_checker/models/students.dart';
import 'package:essay_checker/services/apiServices.dart';
import 'package:flutter/material.dart';

import '../components/navbar.dart';
import 'package:essay_checker/components/uploadFile.dart';
import 'package:essay_checker/components/viewResult.dart';

class ComparisonPage extends StatefulWidget {
  static String id = "/compare";
  final List<Students> students;

  const ComparisonPage({this.students});

  @override
  _ComparisonPageState createState() => _ComparisonPageState();
}

class _ComparisonPageState extends State<ComparisonPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            NavBar(),
            Container(
              height: MediaQuery.of(context).size.height,
              child: FileUpload(
                students: widget.students,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
