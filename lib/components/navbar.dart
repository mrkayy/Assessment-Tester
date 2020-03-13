import 'package:essay_checker/views/comparisonHistoryPage.dart';
import 'package:essay_checker/views/homePage.dart';
import 'package:flutter/material.dart';
// import '../views/comparisonPage.dart';
import '../views/comparisonPage.dart';
import '../views/landingPage.dart';
// import '../views/comparisonHistoryPage.dart';

class LoginNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, constrains) {
      if (constrains.maxWidth > 700 && constrains.maxWidth <= 1800) {
        return LoginMobileNavBar();
      } else if (constrains.maxWidth > 300 && constrains.maxWidth < 700) {
        return LoginMobileNavBar();
      }
      return LoginDesktopNavBar();
    });
  }
}

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

class LoginDesktopNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // elevation: 2.0,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(28.0),
      child: Image.asset(
        "assets/images/3-Line-Logo-2-p-500.png",
        // width: 50.0,
        height: 50.0,
      ),
    );
  }
}

class MobileNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context).size;
    return Material(
      // elevation: 2.0,
      child: Container(
        width: deviceData.width,
        // padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/3-Line-icon.png",
                    width: 30.0,
                    height: 30.0,
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
              alignment: Alignment.center,
              width: deviceData.width,
              color: Colors.blue[200],
              child: Wrap(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          HomePage.id, (route) => false);
                    },
                    child: Text('Home'),
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ComparisonPage()));
                      },
                      child: Text("Compare")),
                  FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ComparisonHistoryPage()));
                      },
                      child: Text("History")),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            LandingPage.id, (route) => false);
                      },
                      child: Text("Logout")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginMobileNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context).size;
    return Container(
      width: deviceData.width,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(28.0),
      child: Image.asset(
        "assets/images/3-Line-Logo-2-p-500.png",
        // width: 25.0,
        height: 30.0,
      ),
    );
  }
}

class DesktopNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      // elevation: 2.0,
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
                FlatButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(HomePage.id, (route) => false);
                  },
                  child: Text('Home'),
                ),
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => ComparisonPage()));
                    },
                    child: Text("Compare")),
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ComparisonHistoryPage()));
                    },
                    child: Text("History")),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => LandingPage()),
                          (route) => false);
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
