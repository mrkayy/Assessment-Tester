import 'package:essay_checker/components/viewResult.dart';
import 'package:essay_checker/models/apiResponseData.dart';
import 'package:essay_checker/models/assessment.dart';
import 'package:essay_checker/models/students.dart';
import 'package:essay_checker/services/apiServices.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../constants.dart';

class FileUpload extends StatefulWidget {
  final List<Students> students;

  const FileUpload({this.students});

  @override
  _FileUploadState createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrain) {
      return DesktopViews(students: widget.students);
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
  ApiServices get services => GetIt.I<ApiServices>();

  final student = Students();
  Assessment comparisonResult;

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
      if (constrain.maxWidth > 1200) {
        return Container(
          // height: deviceData.height,
          // width: deviceData.width,
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            // width: 0.5 * deviceData.width,
            // // height: 0.95 * deviceData.height,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 36.0, horizontal: 70.0),
                              child: Text(
                                'Upload Essay/Assessment below',
                                style: kH1TextStyle.copyWith(fontSize: 24.0),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 0.62 * deviceData.height,
                                width: 0.40 * deviceData.width,
                                child: Card(
                                  child: Column(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10.0),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Text("Pick a student"),
                                                Card(
                                                    child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 18.0),
                                                  child: DropdownButton(
                                                    value: dropdownValue,
                                                    icon: Icon(Icons.person),
                                                    iconSize: 24.0,
                                                    onChanged:
                                                        (String newValue) {
                                                      setState(() {
                                                        dropdownValue =
                                                            newValue;
                                                      });
                                                    },
                                                    items: widget.students.map<
                                                            DropdownMenuItem<
                                                                String>>(
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
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  // color: Colors.indigo,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Icon(Icons.cloud_upload),
                                                      FlatButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                              'upload file')),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 10.0),
                                                  padding: const EdgeInsets.all(
                                                      20.0),
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
                                            margin: const EdgeInsets.only(
                                                top: 10.0),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Text("Pick a student"),
                                                Card(
                                                    child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 18.0),
                                                  child: DropdownButton(
                                                    value: dropdownValue1,
                                                    icon: Icon(Icons.person),
                                                    iconSize: 24.0,
                                                    onChanged:
                                                        (String newValue) {
                                                      setState(() {
                                                        dropdownValue1 =
                                                            newValue;
                                                      });
                                                    },
                                                    items: widget.students.map<
                                                            DropdownMenuItem<
                                                                String>>(
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
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  // color: Colors.indigo,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Icon(Icons.cloud_upload),
                                                      FlatButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                              'upload file')),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 10.0),
                                                  padding: const EdgeInsets.all(
                                                      20.0),
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
                                  print(student.name = dropdownValue);
                                  APIResponse<Assessment> result =
                                      await services.checkSimilarity(student);

                                  print(result.data.result);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ViewResult(
                                        result: result.data,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Compare',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/uploadIcon.png",
                          height: 0.3 * deviceData.height,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Some heading text\n\n",
                                style: kRichTextDefaultTextStyle.copyWith(
                                    fontSize: 24.0),
                              ),
                              TextSpan(
                                text:
                                    "Some heading textjsa;dljkadlkjfldkjlkadad \nkjdllakdjlakjdlajlbdk\nsagdiuysykjhsgySO",
                                style: kRichTextDefaultTextStyle.copyWith(
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (constrain.maxWidth > 800 && constrain.maxWidth < 1200) {
        return Container(
          // height: deviceData.height,
          // width: deviceData.width,
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            // width: 0.5 * deviceData.width,
            // // height: 0.95 * deviceData.height,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 36.0, horizontal: 70.0),
                              child: Text(
                                'Upload Essay/Assessment below',
                                style: kH1TextStyle.copyWith(fontSize: 24.0),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 0.62 * deviceData.height,
                                width: 0.40 * deviceData.width,
                                child: Card(
                                  child: Column(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10.0),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Text("Pick a student"),
                                                Card(
                                                    child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 18.0),
                                                  child: DropdownButton(
                                                    value: dropdownValue,
                                                    icon: Icon(Icons.person),
                                                    iconSize: 24.0,
                                                    onChanged:
                                                        (String newValue) {
                                                      setState(() {
                                                        dropdownValue =
                                                            newValue;
                                                      });
                                                    },
                                                    items: widget.students.map<
                                                            DropdownMenuItem<
                                                                String>>(
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
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  // color: Colors.indigo,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Icon(Icons.cloud_upload),
                                                      FlatButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                              'upload file')),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 10.0),
                                                  padding: const EdgeInsets.all(
                                                      20.0),
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
                                            margin: const EdgeInsets.only(
                                                top: 10.0),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Text("Pick a student"),
                                                Card(
                                                    child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 18.0),
                                                  child: DropdownButton(
                                                    value: dropdownValue1,
                                                    icon: Icon(Icons.person),
                                                    iconSize: 24.0,
                                                    onChanged:
                                                        (String newValue) {
                                                      setState(() {
                                                        dropdownValue1 =
                                                            newValue;
                                                      });
                                                    },
                                                    items: widget.students.map<
                                                            DropdownMenuItem<
                                                                String>>(
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
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  // color: Colors.indigo,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Icon(Icons.cloud_upload),
                                                      FlatButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                              'upload file')),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 10.0),
                                                  padding: const EdgeInsets.all(
                                                      20.0),
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
                                  print(student.name = dropdownValue);
                                  APIResponse<Assessment> result =
                                      await services.checkSimilarity(student);

                                  print(result.data.result);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ViewResult(
                                        result: result.data,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Compare',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/uploadIcon.png",
                          height: 0.3 * deviceData.height,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Some heading text\n\n",
                                style: kRichTextDefaultTextStyle.copyWith(
                                    fontSize: 24.0),
                              ),
                              TextSpan(
                                text:
                                    "Some heading textjsa;dljkadlkjfldkjlkadad \nkjdllakdjlakjdlajlbdk\nsagdiuysykjhsgySO",
                                style: kRichTextDefaultTextStyle.copyWith(
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return Center(child: Text('hello'));
      }
    });
  }
}

class MobileView extends StatefulWidget {
  final List<Students> students;

  const MobileView({
    this.students,
  });

  @override
  _MobileViewState createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  ApiServices get services => GetIt.I<ApiServices>();

  final student = Students();
  Assessment comparisonResult;

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
      if (constrain.maxWidth > 1200) {
        return Container(
          height: deviceData.height,
          width: deviceData.width,
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            // width: 0.5 * deviceData.width,
            // // height: 0.95 * deviceData.height,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 36.0, horizontal: 70.0),
                              child: Text(
                                'Upload Essay/Assessment below',
                                style: kH1TextStyle.copyWith(fontSize: 24.0),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 0.62 * deviceData.height,
                                width: 0.40 * deviceData.width,
                                child: Card(
                                  child: Column(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10.0),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Text("Pick a student"),
                                                Card(
                                                    child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 18.0),
                                                  child: DropdownButton(
                                                    value: dropdownValue,
                                                    icon: Icon(Icons.person),
                                                    iconSize: 24.0,
                                                    onChanged:
                                                        (String newValue) {
                                                      setState(() {
                                                        dropdownValue =
                                                            newValue;
                                                      });
                                                    },
                                                    items: widget.students.map<
                                                            DropdownMenuItem<
                                                                String>>(
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
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  // color: Colors.indigo,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Icon(Icons.cloud_upload),
                                                      FlatButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                              'upload file')),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 10.0),
                                                  padding: const EdgeInsets.all(
                                                      20.0),
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
                                            margin: const EdgeInsets.only(
                                                top: 10.0),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Text("Pick a student"),
                                                Card(
                                                    child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 18.0),
                                                  child: DropdownButton(
                                                    value: dropdownValue1,
                                                    icon: Icon(Icons.person),
                                                    iconSize: 24.0,
                                                    onChanged:
                                                        (String newValue) {
                                                      setState(() {
                                                        dropdownValue1 =
                                                            newValue;
                                                      });
                                                    },
                                                    items: widget.students.map<
                                                            DropdownMenuItem<
                                                                String>>(
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
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  // color: Colors.indigo,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Icon(Icons.cloud_upload),
                                                      FlatButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                              'upload file')),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 10.0),
                                                  padding: const EdgeInsets.all(
                                                      20.0),
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
                                  print(student.name = dropdownValue);
                                  APIResponse<Assessment> result =
                                      await services.checkSimilarity(student);

                                  print(result.data.result);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ViewResult(
                                        result: result.data,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Compare',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/uploadIcon.png",
                          height: 0.3 * deviceData.height,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Some heading text\n\n",
                                style: kRichTextDefaultTextStyle.copyWith(
                                    fontSize: 24.0),
                              ),
                              TextSpan(
                                text:
                                    "Some heading textjsa;dljkadlkjfldkjlkadad \nkjdllakdjlakjdlajlbdk\nsagdiuysykjhsgySO",
                                style: kRichTextDefaultTextStyle.copyWith(
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (constrain.maxWidth > 800 && constrain.maxWidth < 1200) {
        return Container(
          height: deviceData.height,
          width: deviceData.width,
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            // width: 0.5 * deviceData.width,
            // // height: 0.95 * deviceData.height,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 36.0, horizontal: 70.0),
                              child: Text(
                                'Upload Essay/Assessment below',
                                style: kH1TextStyle.copyWith(fontSize: 24.0),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 0.62 * deviceData.height,
                                width: 0.40 * deviceData.width,
                                child: Card(
                                  child: Column(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10.0),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Text("Pick a student"),
                                                Card(
                                                    child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 18.0),
                                                  child: DropdownButton(
                                                    value: dropdownValue,
                                                    icon: Icon(Icons.person),
                                                    iconSize: 24.0,
                                                    onChanged:
                                                        (String newValue) {
                                                      setState(() {
                                                        dropdownValue =
                                                            newValue;
                                                      });
                                                    },
                                                    items: widget.students.map<
                                                            DropdownMenuItem<
                                                                String>>(
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
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  // color: Colors.indigo,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Icon(Icons.cloud_upload),
                                                      FlatButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                              'upload file')),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 10.0),
                                                  padding: const EdgeInsets.all(
                                                      20.0),
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
                                            margin: const EdgeInsets.only(
                                                top: 10.0),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Text("Pick a student"),
                                                Card(
                                                    child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 18.0),
                                                  child: DropdownButton(
                                                    value: dropdownValue1,
                                                    icon: Icon(Icons.person),
                                                    iconSize: 24.0,
                                                    onChanged:
                                                        (String newValue) {
                                                      setState(() {
                                                        dropdownValue1 =
                                                            newValue;
                                                      });
                                                    },
                                                    items: widget.students.map<
                                                            DropdownMenuItem<
                                                                String>>(
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
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  // color: Colors.indigo,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Icon(Icons.cloud_upload),
                                                      FlatButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                              'upload file')),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 10.0),
                                                  padding: const EdgeInsets.all(
                                                      20.0),
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
                                  print(student.name = dropdownValue);
                                  APIResponse<Assessment> result =
                                      await services.checkSimilarity(student);

                                  print(result.data.result);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ViewResult(
                                        result: result.data,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Compare',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/uploadIcon.png",
                          height: 0.3 * deviceData.height,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Some heading text\n\n",
                                style: kRichTextDefaultTextStyle.copyWith(
                                    fontSize: 24.0),
                              ),
                              TextSpan(
                                text:
                                    "Some heading textjsa;dljkadlkjfldkjlkadad \nkjdllakdjlakjdlajlbdk\nsagdiuysykjhsgySO",
                                style: kRichTextDefaultTextStyle.copyWith(
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return Center(child: Text('hello'));
      }
    });
  }
}
