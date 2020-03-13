import 'package:flutter/material.dart';
import '../constants.dart';
import '../views/comparisonPage.dart';
import '../views/comparisonHistoryPage.dart';

class Sections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constrain) {
      if (constrain.maxWidth <= 800) {
        // return mobile view
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  height: 0.45 * MediaQuery.of(context).size.height,
                  child: Image.asset("assets/images/humans.png")),
              Container(
                height: 0.8 * deviceData.height,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 0.25 * deviceData.height,
                        width: 0.62 * deviceData.width,
                        // color: Colors.green,
                        // padding: const EdgeInsets.all(18.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text:
                                      "DO YOU NEED TO A CONFIRM PLAGIARISM IN AN ESSAY?\n\n",
                                  style: kRichTextDefaultTextStyle.copyWith(
                                      fontSize: 24.0)),
                              TextSpan(
                                  text: "You can this in just three steps.\n",
                                  style: kRichTextDefaultTextStyle.copyWith(
                                      fontSize: 14.0)),
                              TextSpan(
                                  text: "Lets get started here",
                                  style: kRichTextDefaultTextStyle.copyWith(
                                      fontSize: 14.0)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => ComparisonPage(),
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(12.0),
                            child: Container(
                              padding: const EdgeInsets.all(21.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                border: Border.all(),
                              ),
                              child: Text('Compare Essay'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => ComparisonHistoryPage()));
                            },
                            borderRadius: BorderRadius.circular(12.0),
                            child: Container(
                              padding: const EdgeInsets.all(21.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                border: Border.all(),
                              ),
                              child: Text('View History'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 0.8 * deviceData.height,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 0.3 * deviceData.height,
                        width: 400.0,
                        // color: Colors.green,
                        padding: const EdgeInsets.all(18.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text:
                                      "DO YOU NEED TO A CONFIRM PLAGIARISM IN AN ESSAY?\n\n",
                                  style: kRichTextDefaultTextStyle.copyWith(
                                      fontSize: 24.0)),
                              TextSpan(
                                  text: "You can this in just three steps.\n",
                                  style: kRichTextDefaultTextStyle.copyWith(
                                      fontSize: 14.0)),
                              TextSpan(
                                  text: "Lets get started here",
                                  style: kRichTextDefaultTextStyle.copyWith(
                                      fontSize: 14.0)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ComparisonPage(),
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(12.0),
                            child: Container(
                              padding: const EdgeInsets.all(21.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                border: Border.all(),
                              ),
                              child: Text('Compare Essay'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => ComparisonHistoryPage()),
                              );
                            },
                            borderRadius: BorderRadius.circular(12.0),
                            child: Container(
                              padding: const EdgeInsets.all(21.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                border: Border.all(),
                              ),
                              child: Text('View History'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  height: 0.65 * MediaQuery.of(context).size.height,
                  // color: Colors.pink,
                  child: Image.asset("assets/images/humans.png")),
            )
          ],
        ),
      );
    });
  }
}
