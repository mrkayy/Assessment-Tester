// import 'package:essay_checker/models/apiResponseData.dart';

import 'package:essay_checker/models/assessment.dart';
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

  // List<Students> _students = LocalService.getStudents();
  Future<List<Students>> getStudentsList() async {
    // final List<Students>
    var _apiStudents = await services.getStudents();
    return _apiStudents;
  }

  Future<Assessment> getAssessment() async {
    final _assessment = await services.getstudentAssessment();
    print('Response OK: ' + _assessment.result);
    return _assessment;
  }

  Students _selectedStudents;
  Students _selectedStudent;
  // Future<Assessment> _assessmentResult;
  Assessment _assessmentResult;

  List<DropdownMenuItem<Students>> _dropDownMenuItems;

  List<DropdownMenuItem<Students>> buildDropDownItemsList(List students) {
    List<DropdownMenuItem<Students>> items = List();
    for (Students student in students) {
      items.add(DropdownMenuItem(
        value: student,
        child: Text(student.name),
      ));
    }
    return items;
  }

  onChangedDropDown(Students student) {
    setState(() {
      _selectedStudents = student;
      _selectedStudent = student;
    });
  }

  @override
  void initState() {
    // fetchStudentList();
    getAssessment();
    getStudentsList().then((value) {
      _dropDownMenuItems = buildDropDownItemsList(value);
      setState(() {
        _selectedStudents = _dropDownMenuItems.first.value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constrain) {
            if (constrain.maxWidth <= 800 && constrain.maxWidth > 700) {
              return buildMediumScreenLayout(deviceData);
            } else if (constrain.maxWidth > 300 && constrain.maxWidth < 700) {
              return buildSmallScreenLayout(deviceData);
            }
            return buildDesktopScreenLayout(deviceData);
          },
        ),
      ),
    );
  }

  Container buildDesktopScreenLayout(Size deviceData) {
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
                                            "Select a student",
                                          ),
                                          DropdownButton(
                                            value: _selectedStudents,
                                            icon: Icon(Icons.person),
                                            iconSize: 24.0,
                                            items: _dropDownMenuItems,
                                            onChanged: onChangedDropDown,
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
                              ),
                              SizedBox(height: 10.0),
                              Card(
                                child: Column(
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
                                            "Select a student",
                                          ),
                                          DropdownButton(
                                            value: _selectedStudents,
                                            icon: Icon(Icons.person),
                                            iconSize: 24.0,
                                            items: _dropDownMenuItems,
                                            onChanged: onChangedDropDown,
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
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.0),
                        RaisedButton(
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
                          onPressed: () {
                            getAssessment().then((data) => setState(() {
                                  _assessmentResult = data;
                                }));
                            print('selected: ${_selectedStudents.name}');
                            print('selected: ${_assessmentResult.result}');
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 36.0),
                  alignment: Alignment.center,
                  child: FutureBuilder(
                    future: _assessmentResult as Future<Assessment>,
                    // initialData: InitialData,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return snapshot.hasData
                          ? Card(
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Text(
                                        'RESULTS:',
                                        style: kRichTextDefaultTextStyle,
                                      ),
                                    ),
                                    // SizedBox(height: 15.0),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                  text: "Comparison Result: ",
                                                  style:
                                                      kRichTextDefaultTextStyle),
                                              TextSpan(
                                                text:
                                                    "\n${snapshot.data.result}",
                                                style: kRichTextDefaultTextStyle
                                                    .copyWith(
                                                  color: snapshot.data.result ==
                                                          'failed'
                                                      ? Colors.redAccent
                                                      : Colors.green,
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                  text: "Plagiarisim: ",
                                                  style:
                                                      kRichTextDefaultTextStyle),
                                              TextSpan(
                                                text:
                                                    "\n${snapshot.data.similarity}%",
                                                style: kRichTextDefaultTextStyle
                                                    .copyWith(
                                                  color: Colors.redAccent,
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                  text: "Unique: ",
                                                  style:
                                                      kRichTextDefaultTextStyle),
                                              TextSpan(
                                                text:
                                                    "\n${snapshot.data.unique}%",
                                                style: kRichTextDefaultTextStyle
                                                    .copyWith(
                                                  color: Colors.green,
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 20.0),
                                      padding: const EdgeInsets.all(20.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                            color: Colors.grey[200],
                                            width: 1.5),
                                      ),
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text:
                                                    '''ruewrwuhsuhdlkjhiuwhrekhsdkjshda vn;kjv;kjnd;kjdv;ksjbv;kjv ajvakvjaiudvibvkb kaid bi iauadb\n''',
                                                style:
                                                    kRichTextDefaultTextStyle),
                                            TextSpan(
                                                text:
                                                    '''dkjs;fja;j;asklfa;dlkn;lkfslkd;skndf;lksvlkms;removmrmv'rvm;lvmcv\n''',
                                                style:
                                                    kRichTextDefaultTextStyle),
                                            TextSpan(
                                                text:
                                                    '''skldkjdsflkdsflkjfdslgkjlfdskjghsr iud liuhlkdsvagiun vahdgaivn aliulaj ad\n''',
                                                style:
                                                    kRichTextDefaultTextStyle),
                                            TextSpan(
                                                text: '',
                                                style:
                                                    kRichTextDefaultTextStyle),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 35.0, horizontal: 50.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.warning,
                                      size: 52.0,
                                      color: Colors.grey[400],
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      'No Comparison Result avaliable!',
                                      style: kRichTextDefaultTextStyle.copyWith(
                                        color: Colors.grey[400],
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                    },
                  ),
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
  }

  Container buildMediumScreenLayout(Size deviceData) {
    return Container(
      child: Column(
        children: <Widget>[
          NavBar(),
          Container(
            alignment: Alignment.center,
            width: deviceData.width,
            // height: deviceData.height,
            padding: const EdgeInsets.all(36.0),
            // color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Upload File',
                  style: kRichTextDefaultTextStyle.copyWith(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  // color: Colors.amber,
                  alignment: Alignment.center,
                  width: deviceData.width * 0.75,
                  child: Column(
                    children: <Widget>[
                      Card(
                        child: Column(
                          children: <Widget>[
                            Container(
                              // color: Colors.blueAccent[100],
                              margin: const EdgeInsets.only(top: 10.0),
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 45.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Select a student",
                                  ),
                                  DropdownButton(
                                    value: _selectedStudents,
                                    icon: Icon(Icons.person),
                                    iconSize: 24.0,
                                    items: _dropDownMenuItems,
                                    onChanged: onChangedDropDown,
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
                      ),
                      SizedBox(height: 10.0),
                      Card(
                        child: Column(
                          children: <Widget>[
                            Container(
                              // color: Colors.blueAccent[100],
                              margin: const EdgeInsets.only(top: 10.0),
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 45.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Select a student",
                                  ),
                                  DropdownButton(
                                    value: _selectedStudents,
                                    icon: Icon(Icons.person),
                                    iconSize: 24.0,
                                    items: _dropDownMenuItems,
                                    onChanged: onChangedDropDown,
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
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    elevation: 1.0,
                    minWidth: deviceData.width * 0.40,
                    height: deviceData.height * 0.05,
                    onPressed: () {},
                    child: Text(
                      'Compare',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            alignment: Alignment.center,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 35.0, horizontal: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.warning,
                      size: 52.0,
                      color: Colors.grey[400],
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'No Comparison Result avaliable!',
                      style: kRichTextDefaultTextStyle.copyWith(
                        color: Colors.grey[400],
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Container buildSmallScreenLayout(Size deviceData) {
    return Container(
        child: Column(
      children: <Widget>[
        NavBar(),
        Container(
          alignment: Alignment.topCenter,
          width: deviceData.width,
          // height: deviceData.height,
          margin: const EdgeInsets.only(bottom: 10.0, left: 26.0, right: 26.0),
          padding: const EdgeInsets.all(15.0),
          // color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text(
                  'Upload File',
                  style: kRichTextDefaultTextStyle.copyWith(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Select Student: '),
                          DropdownButton(
                            value: _selectedStudent,
                            icon: Icon(Icons.person),
                            iconSize: 24.0,
                            items: _dropDownMenuItems,
                            onChanged: onChangedDropDown,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          border:
                              Border.all(width: 1.5, color: Colors.grey[200])),
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.cloud_upload)),
                          Text('filePath'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Select Student: '),
                          DropdownButton(
                            value: _selectedStudents,
                            icon: Icon(Icons.person),
                            iconSize: 24.0,
                            items: _dropDownMenuItems,
                            onChanged: onChangedDropDown,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          border:
                              Border.all(width: 1.5, color: Colors.grey[200])),
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.cloud_upload)),
                          Text('filePath'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                alignment: Alignment.center,
                child: MaterialButton(
                  elevation: 1.0,
                  minWidth: deviceData.width * 0.40,
                  height: deviceData.height * 0.05,
                  onPressed: () {},
                  child: Text(
                    'Compare',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                alignment: Alignment.center,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 35.0, horizontal: 50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.warning,
                          size: 52.0,
                          color: Colors.grey[400],
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'No Comparison Result avaliable!',
                          style: kRichTextDefaultTextStyle.copyWith(
                            color: Colors.grey[400],
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
