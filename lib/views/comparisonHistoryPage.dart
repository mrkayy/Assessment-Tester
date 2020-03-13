import 'package:essay_checker/constants.dart';
// import 'package:essay_checker/models/apiResponseData.dart';
import 'package:essay_checker/models/records.dart';
import 'package:essay_checker/services/apiServices.dart';
import 'package:flutter/material.dart';
// import 'package:essay_checker/services/apiServices.dart';
import 'package:get_it/get_it.dart';

import '../components/navbar.dart';

class ComparisonHistoryPage extends StatefulWidget {
  final student1;
  final student2;

  ComparisonHistoryPage({this.student1, this.student2});

  static String id = '/history';
  @override
  _ComparisonHistoryPageState createState() => _ComparisonHistoryPageState();
}

class _ComparisonHistoryPageState extends State<ComparisonHistoryPage> {
  ApiServices get services => GetIt.I<ApiServices>();

  Future<List<Records>> _apiResponse;

  getRecordsList() async {
    _apiResponse = services.getAssessmentRecord();
  }

  @override
  void initState() {
    getRecordsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (BuildContext context, constrain) {
            //Mobile Medium Screen
            if (constrain.maxWidth <= 800 && constrain.maxWidth > 700) {
              return buildMediumScreenLayout(deviceData);
            }

            /// Mobile Small Screen ///
            else if (constrain.maxWidth > 300 && constrain.maxWidth < 700) {
              return buildSmallScreenLayout(deviceData);
            }
            return buildDesktopScreenLayout(deviceData);
          },
        ),
      ),
    );
  }

  Column buildSmallScreenLayout(Size deviceData) {
    return Column(
      children: <Widget>[
        NavBar(),
        SizedBox(height: 10.0),
        Container(
          width: deviceData.width,
          child: Column(
            children: <Widget>[
              Container(
                height: deviceData.height * 0.35,
                width: deviceData.width * 0.95,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Card(
                        child: Text('Student Name'),
                        // DropdownButton(),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(child: Text('Moble View')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.grey[100],
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Records",
                      style: kRichTextDefaultTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Data\n",
                                  style: kRichTextDefaultTextStyle.copyWith(
                                      color: Colors.grey)),
                              TextSpan(
                                  text: DateTime.now().toString(),
                                  style: kRichTextDefaultTextStyle.copyWith()),
                            ],
                          ),
                        ),
                        SizedBox(width: 20.0),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Status\n",
                                  style: kRichTextDefaultTextStyle.copyWith(
                                      color: Colors.grey)),
                              TextSpan(
                                  text: "All",
                                  style: kRichTextDefaultTextStyle.copyWith()),
                            ],
                          ),
                        ),
                        SizedBox(width: 20.0),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Count\n",
                                  style: kRichTextDefaultTextStyle.copyWith(
                                      color: Colors.grey)),
                              TextSpan(
                                  text: "{length}",
                                  style: kRichTextDefaultTextStyle.copyWith()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {},
                      child: Text(
                        'Refresh',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                    ),
                    Container(
                      // height: 0.65 * deviceData.height,
                      width: double.infinity,
                      child: Card(
                        child: FutureBuilder<List<Records>>(
                          future: _apiResponse,
                          // initialData: Center(child: CircleProgress),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            return snapshot.hasData
                                ? SingleChildScrollView(
                                    child: DataTable(
                                      columns: [
                                        DataColumn(
                                          label: Text('STUDENT'),
                                        ),
                                        DataColumn(
                                          label: Text('RESULT'),
                                        ),
                                        DataColumn(
                                          label: Text('SIMILARITY'),
                                        ),
                                        DataColumn(
                                          label: Text('UNIQUE'),
                                        )
                                      ],
                                      rows: snapshot.data
                                          .map<DataRow>(
                                            (r) => DataRow(
                                              cells: [
                                                DataCell(Text(r.student)),
                                                DataCell(r.result == 'pass'
                                                    ? Card(
                                                        color: Colors.green,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5.0),
                                                          child: Text(r.result),
                                                        ))
                                                    : Card(
                                                        color: Colors.redAccent,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5.0),
                                                          child: Text(r.result),
                                                        ))),
                                                DataCell(Text(r.similar)),
                                                DataCell(Text(r.unique)),
                                              ],
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(50.0),
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column buildDesktopScreenLayout(Size deviceData) {
    return Column(
      children: <Widget>[
        NavBar(),
        SizedBox(height: 10.0),
        Container(
          width: deviceData.width,
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 15.0),
                width: 0.25 * deviceData.width,
                child: Card(
                  child: Container(
                    width: 0.14 * deviceData.width,
                    // height: 0.20 * deviceData.height,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8.0),
                    child: Text('data'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: Colors.grey[200],
                        margin: const EdgeInsets.only(bottom: 18.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Records",
                              style: kRichTextDefaultTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "Data\n",
                                          style: kRichTextDefaultTextStyle
                                              .copyWith(color: Colors.grey)),
                                      TextSpan(
                                          text:
                                              DateTime.now().toIso8601String(),
                                          style: kRichTextDefaultTextStyle
                                              .copyWith()),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20.0),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "Status\n",
                                          style: kRichTextDefaultTextStyle
                                              .copyWith(color: Colors.grey)),
                                      TextSpan(
                                          text: "All",
                                          style: kRichTextDefaultTextStyle
                                              .copyWith()),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20.0),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "Count\n",
                                          style: kRichTextDefaultTextStyle
                                              .copyWith(color: Colors.grey)),
                                      TextSpan(
                                          text: "{length}",
                                          style: kRichTextDefaultTextStyle
                                              .copyWith()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: () {
                              // print(_apiResponse.first.student);
                            },
                            child: Text(
                              'Refresh',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blue,
                          ),
                          Container(
                            // height: 0.65 * deviceData.height,
                            width: double.infinity,
                            child: Card(
                              child: FutureBuilder<List<Records>>(
                                future: _apiResponse,
                                // initialData: Center(child: CircleProgress),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  return snapshot.hasData
                                      ? DataTable(
                                          columns: [
                                            DataColumn(
                                              label: Text('STUDENT'),
                                            ),
                                            DataColumn(
                                              label: Text('RESULT'),
                                            ),
                                            DataColumn(
                                              label: Text('SIMILARITY'),
                                            ),
                                            DataColumn(
                                              label: Text('UNIQUE'),
                                            )
                                          ],
                                          rows: snapshot.data
                                              .map<DataRow>(
                                                (r) => DataRow(
                                                  cells: [
                                                    DataCell(Text(r.student)),
                                                    DataCell(r.result == 'pass'
                                                        ? Card(
                                                            color: Colors.green,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5.0),
                                                              child: Text(
                                                                  r.result),
                                                            ))
                                                        : Card(
                                                            color: Colors.red,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5.0),
                                                              child: Text(
                                                                  r.result),
                                                            ))),
                                                    DataCell(Text(r.similar)),
                                                    DataCell(Text(r.unique)),
                                                  ],
                                                ),
                                              )
                                              .toList(),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(50.0),
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Column buildMediumScreenLayout(Size deviceData) {
    return Column(
      children: <Widget>[
        NavBar(),
        SizedBox(height: 10.0),
        Container(
          width: deviceData.width,
          child: Column(
            children: <Widget>[
              Container(
                height: deviceData.height * 0.35,
                width: deviceData.width * 0.95,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Card(
                        child: Text('Student Name'),
                        // DropdownButton(),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(child: Text('Moble View')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.grey[100],
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Records",
                      style: kRichTextDefaultTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Data\n",
                                  style: kRichTextDefaultTextStyle.copyWith(
                                      color: Colors.grey)),
                              TextSpan(
                                  text: DateTime.now().toString(),
                                  style: kRichTextDefaultTextStyle.copyWith()),
                            ],
                          ),
                        ),
                        SizedBox(width: 20.0),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Status\n",
                                  style: kRichTextDefaultTextStyle.copyWith(
                                      color: Colors.grey)),
                              TextSpan(
                                  text: "All",
                                  style: kRichTextDefaultTextStyle.copyWith()),
                            ],
                          ),
                        ),
                        SizedBox(width: 20.0),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Count\n",
                                  style: kRichTextDefaultTextStyle.copyWith(
                                      color: Colors.grey)),
                              TextSpan(
                                  text: "length",
                                  style: kRichTextDefaultTextStyle.copyWith()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {},
                      child: Text(
                        'Refresh',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                    ),
                    Container(
                      // height: 0.65 * deviceData.height,
                      width: double.infinity,
                      child: Card(
                        child: FutureBuilder<List<Records>>(
                          future: _apiResponse,
                          // initialData: Center(child: CircleProgress),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            return snapshot.hasData
                                ? SingleChildScrollView(
                                    child: DataTable(
                                      columns: [
                                        DataColumn(
                                          label: Text('STUDENT'),
                                        ),
                                        DataColumn(
                                          label: Text('RESULT'),
                                        ),
                                        DataColumn(
                                          label: Text('SIMILARITY'),
                                        ),
                                        DataColumn(
                                          label: Text('UNIQUE'),
                                        )
                                      ],
                                      rows: snapshot.data
                                          .map<DataRow>(
                                            (r) => DataRow(
                                              cells: [
                                                DataCell(Text(r.student)),
                                                DataCell(r.result == 'pass'
                                                    ? Card(
                                                        color: Colors.green,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5.0),
                                                          child: Text(r.result),
                                                        ))
                                                    : Card(
                                                        color: Colors.red,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5.0),
                                                          child: Text(r.result),
                                                        ))),
                                                DataCell(Text(r.similar)),
                                                DataCell(Text(r.unique)),
                                              ],
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(50.0),
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
