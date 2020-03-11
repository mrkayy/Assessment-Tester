import 'package:essay_checker/components/viewResult.dart';
// import 'package:essay_checker/models/apiResponseData.dart';
// import 'package:essay_checker/models/assessment.dart';
import 'package:essay_checker/models/students.dart';
// import 'package:essay_checker/services/apiServices.dart';
import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';

import '../constants.dart';

class FileUpload extends StatelessWidget {
  final List<Students> studentList;

  FileUpload({this.studentList});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrain) {
      if (constrain.maxWidth < 800) {
        // Return desktop view
        return Container(
            child: Center(
          child: Text('Loading...'),
        ));
      }
      return Container(
        color: Colors.amber,
        child: Text('hello'),
      );

      // ? DesktopViews(students: studentList)
      // : Container(
      //     child: Center(
      //     child: Text('Loading...'),
      //   ));
    });
  }
}

class DesktopViews extends StatefulWidget {
  final List<Students> students;

  const DesktopViews({
    this.students,
  });

  @override
  _DesktopViewsState createState() => _DesktopViewsState();
}

class _DesktopViewsState extends State<DesktopViews> {
  // ApiServices get services => GetIt.I<ApiServices>();
//
  final selectedStudent = Students();
  // Assessment comparisonResult;

  String dropdownValue;
  String dropdownValue1;

  @override
  void initState() {
    dropdownValue = widget.students.elementAt(0).name;
    dropdownValue1 = widget.students.elementAt(0).name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (BuildContext context, constrain) {
      if (constrain.maxWidth <= 800) {
        return null;
      }
      return Container(
        // height: deviceData.height,
        width: deviceData.width,
        alignment: Alignment.center,
        child: Container(
          // color: Colors.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 70.0, vertical: 20.0),
                child: Text(
                  'Upload Essay/Assessment below',
                  style: kH1TextStyle.copyWith(fontSize: 24.0),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 0.62 * deviceData.height,
                  width: 0.80 * deviceData.width,
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(bottom: 10.0),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text("Pick a student"),
                                  Card(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0),
                                    child: DropdownButton(
                                      value: dropdownValue,
                                      icon: Icon(Icons.person),
                                      iconSize: 24.0,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue = newValue;
                                        });
                                      },
                                      items: widget.students
                                          .map<DropdownMenuItem<String>>(
                                              (Students value) {
                                        return DropdownMenuItem(
                                          child: Text(value.name),
                                          value: value.name,
                                        );
                                      }).toList(),
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(20.0),
                                    // color: Colors.indigo,
                                    child: Column(
                                      children: <Widget>[
                                        Icon(Icons.cloud_upload),
                                        FlatButton(
                                            onPressed: () {},
                                            child: Text('upload file')),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10.0),
                                    padding: const EdgeInsets.all(20.0),
                                    color: Colors.blue[100],
                                    child: Column(
                                      children: <Widget>[
                                        Text('FilePath'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text("Pick a student"),
                                  Card(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0),
                                    child: DropdownButton(
                                      value: dropdownValue1,
                                      icon: Icon(Icons.person),
                                      iconSize: 24.0,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue1 = newValue;
                                        });
                                      },
                                      items: widget.students
                                          .map<DropdownMenuItem<String>>(
                                              (Students value) {
                                        return DropdownMenuItem(
                                          child: Text(value.name),
                                          value: value.name,
                                        );
                                      }).toList(),
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(20.0),
                                    // color: Colors.indigo,
                                    child: Column(
                                      children: <Widget>[
                                        Icon(Icons.cloud_upload),
                                        FlatButton(
                                            onPressed: () {},
                                            child: Text('upload file')),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10.0),
                                    padding: const EdgeInsets.all(20.0),
                                    color: Colors.blue[100],
                                    child: Column(
                                      children: <Widget>[
                                        Text('FilePath'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 70.0, vertical: 15.0),
                child: RaisedButton(
                  elevation: 2,
                  color: Colors.blueAccent[200],
                  onPressed: () async {
                    print(selectedStudent.name = dropdownValue);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ViewResult(
                              student: selectedStudent,
                            )));

                    // print(result.data.result);
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (BuildContext context) => ViewResult(
                    //       result: assessment.data,
                    //     ),
                    //   ),
                    // );
                  },
                  child: Text(
                    'Compare',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
