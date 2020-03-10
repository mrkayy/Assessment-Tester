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
      body: LayoutBuilder(
        builder: (context, constrain) {
          if (constrain.maxWidth < 800) {
            return SingleChildScrollView(
              child: Container(
                height: 1.5 * MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    NavBar(),
                    FileUpload(
                      students: widget.students,
                    ),
                  ],
                ),
              ),
            );
          }

          return Container(
            child: Column(
              children: <Widget>[
                NavBar(),
                FileUpload(
                  students: widget.students,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
