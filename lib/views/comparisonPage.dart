import 'package:essay_checker/models/apiResponseData.dart';
import 'package:essay_checker/models/students.dart';
import 'package:essay_checker/services/apiServices.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../components/navbar.dart';

import '../constants.dart';
// import 'package:essay_checker/components/viewResult.dart';

class ComparisonPage extends StatefulWidget {
  static String id = "/compare";

  @override
  _ComparisonPageState createState() => _ComparisonPageState();
}

class _ComparisonPageState extends State<ComparisonPage> {
  ApiServices get services => GetIt.I<ApiServices>();
  static APIResponse<List<Students>> _apiResponse;
  bool loading = false;
  final selectedStudent = Students();
  // apiResponse = fetchStudents();

  _fetchStudentList() async {
    setState(() {
      loading = !loading;
    });
    _apiResponse = await services.getStudents();
    setState(() {
      loading = !loading;
    });
  }

  final studentName = Students();
  final initSudentName = Students();

  // var dropdownValue1 = _apiResponse.data.elementAt(0);

  // List<Students> fetchStudents() async {
  //   var sapiResponse = await services.getStudents();
  //   print(apiResponse.data[0].name);
  //   return sapiResponse.data;
  // }

  @override
  void initState() {
    _fetchStudentList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context).size;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrain) {
          if (constrain.maxWidth < 800) {
            return Container(
              child: Column(
                children: <Widget>[
                  NavBar(),
                  Container(
                    alignment: Alignment.topCenter,
                    width: deviceData.width,
                    // height: deviceData.height,
                    padding: const EdgeInsets.all(36.0),
                    // color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Upload Accessment File',
                          style: kRichTextDefaultTextStyle.copyWith(
                            fontSize: 24.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: deviceData.width * 0.85,
                          height: deviceData.height * 0.55,
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      // color: Colors.blueAccent[100],
                                      margin: const EdgeInsets.only(top: 10.0),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 45.0,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("Pick a student"),
                                          Card(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 18.0),
                                              // child: DropdownButton(
                                              //   value: dropdownValue,
                                              //   icon: Icon(Icons.person),
                                              //   iconSize: 24.0,
                                              //   onChanged: (String newValue) {
                                              //     setState(() {
                                              //       dropdownValue = newValue;
                                              //     });
                                              //   },
                                              //   items: _apiResponse.data.map<
                                              //           DropdownMenuItem<
                                              //               String>>(
                                              //       (Students value) {
                                              //     return DropdownMenuItem(
                                              //       child: Text(value.name),
                                              //       value: value.name,
                                              //     );
                                              //   }).toList(),
                                              // ),
                                            ),
                                          ),
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
                                            margin: const EdgeInsets.only(
                                                right: 10.0),
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
                                Divider(
                                    height: 10.0,
                                    indent: 0.0,
                                    color: Colors.grey),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      // color: Colors.blueAccent[100],
                                      margin: const EdgeInsets.only(top: 10.0),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 45.0,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "Pick a student",
                                          ),
                                          Card(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 18.0),
                                              child: null,
                                              // DropdownButton(
                                              //   value: dropdownValue1,
                                              //   icon: Icon(Icons.person),
                                              //   iconSize: 24.0,
                                              //   onChanged: (String newValue) {
                                              //     setState(() {
                                              //       dropdownValue1 = newValue;
                                              //     });
                                              //   },
                                              //   items: widget.students
                                              //       .map<DropdownMenuItem<String>>(
                                              //           (Students value) {
                                              //     return DropdownMenuItem(
                                              //       child: Text(value.name),
                                              //       value: value.name,
                                              //     );
                                              //   }).toList(),
                                              // ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.all(20.0),
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
                                            margin: const EdgeInsets.only(
                                                right: 10.0),
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
                        SizedBox(height: 10.0),
                        FlatButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35.0, vertical: 10.0),
                          child: Text(
                            'Compare',
                            style: kRichTextDefaultTextStyle.copyWith(
                                color: Colors.white),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
            // );
          }
          return Container(
            child: Column(
              children: <Widget>[
                NavBar(),
                Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      width: deviceData.width / 2,
                      // height: deviceData.height,
                      padding: const EdgeInsets.all(36.0),
                      child: Row(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: deviceData.width * 0.85 / 2,
                                // height: deviceData.height * 0.552,
                                child: Column(
                                  children: <Widget>[
                                    Card(
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            // color: Colors.blueAccent[100],
                                            margin: const EdgeInsets.only(
                                                top: 10.0),
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10.0,
                                              horizontal: 45.0,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  "Pick a student",
                                                ),
                                                Card(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 18.0),
                                                    child: null,
                                                    // DropdownButton(
                                                    //   value: dropdownValue1,
                                                    //   icon: Icon(Icons.person),
                                                    //   iconSize: 24.0,
                                                    //   onChanged: (String newValue) {
                                                    //     setState(() {
                                                    //       dropdownValue1 = newValue;
                                                    //     });
                                                    //   },
                                                    //   items: widget.students
                                                    //       .map<DropdownMenuItem<String>>(
                                                    //           (Students value) {
                                                    //     return DropdownMenuItem(
                                                    //       child: Text(value.name),
                                                    //       value: value.name,
                                                    //     );
                                                    //   }).toList(),
                                                    // ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
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
                                    ),
                                    SizedBox(height: 10.0),
                                    Card(
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            // color: Colors.blueAccent[100],
                                            margin: const EdgeInsets.only(
                                                top: 10.0),
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10.0,
                                              horizontal: 45.0,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  "Pick a student",
                                                ),
                                                Card(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 18.0),
                                                    child: null,
                                                    // DropdownButton(
                                                    //   value: dropdownValue1,
                                                    //   icon: Icon(Icons.person),
                                                    //   iconSize: 24.0,
                                                    //   onChanged: (String newValue) {
                                                    //     setState(() {
                                                    //       dropdownValue1 = newValue;
                                                    //     });
                                                    //   },
                                                    //   items: widget.students
                                                    //       .map<DropdownMenuItem<String>>(
                                                    //           (Students value) {
                                                    //     return DropdownMenuItem(
                                                    //       child: Text(value.name),
                                                    //       value: value.name,
                                                    //     );
                                                    //   }).toList(),
                                                    // ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
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
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 15.0),
                              FlatButton(
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 35.0, vertical: 10.0),
                                child: Text(
                                  'Compare',
                                  style: kRichTextDefaultTextStyle.copyWith(
                                      color: Colors.white),
                                ),
                                onPressed: () {},
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // color: Colors.blueAccent,
                      width: deviceData.width / 2,
                      // height: deviceData.height,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Upload Files",
                                    style: kRichTextDefaultTextStyle.copyWith(
                                        fontSize: 24.0)),
                                TextSpan(text: ""),
                              ],
                            ),
                          ),
                          SizedBox(height: 28.0),
                          Image.asset("assets/images/cheating.png"),
                        ],
                      ),
                    ),
                  ],
                ),
                // DesktopScreen(),
                // FileUpload(
                //   studentList: _apiResponse.data,
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
