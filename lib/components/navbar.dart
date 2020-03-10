import 'package:flutter/material.dart';
import '../views/comparisonPage.dart';
import '../views/landingPage.dart';
import '../views/comparisonHistoryPage.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, constrains) {
        if (constrains.maxWidth > 1200) {
          return DesktopNavBar();
        } else if (constrains.maxWidth > 800 && constrains.maxWidth < 1200) {
          return DesktopNavBar();
        } else {
          return MobileNavBar();
        }
      },
    );
  }
}

class DesktopNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/3-Line-icon.png",
                    width: 50.0,
                    height: 50.0,
                  ),
                  SizedBox(width: 10),
                  Text(
                    '3Line Card Management',
                    style: TextStyle(fontFamily: "WorkSans", fontSize: 18.0),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(onPressed: () {}, child: Text("Home")),
                FlatButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (BuildContext context) => ComparisonPage()));
                    },
                    child: Text("Compare")),
                FlatButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (BuildContext context) =>
                      //         ComparisonHistoryPage()));
                    },
                    child: Text("History")),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => LandingPage()));
                    },
                    child: Text("Logout")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MobileNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context).size;
    return Material(
      elevation: 2.0,
      child: Container(
        width: deviceData.width,
        // padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/3-Line-icon.png",
                    width: 50.0,
                    height: 50.0,
                  ),
                  SizedBox(width: 10),
                  Text(
                    '3Line Card Management',
                    style: TextStyle(fontFamily: "WorkSans", fontSize: 18.0),
                  ),
                ],
              ),
            ),
            Container(
              width: deviceData.width,
              color: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(onPressed: () {}, child: Text("Home")),
                  FlatButton(
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (_) => ComparisonPage()));
                      },
                      child: Text("Compare")),
                  FlatButton(
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (_) => ComparisonHistoryPage()));
                      },
                      child: Text("History")),
                  FlatButton(onPressed: () {}, child: Text("Logout")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
