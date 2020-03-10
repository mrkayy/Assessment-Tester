import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import './views/homePage.dart';
import './views/landingPage.dart';
import './views/comparisonPage.dart';
import './views/comparisonHistoryPage.dart';
import './services/apiServices.dart';

void setupServiceLocator() {
  GetIt.I.registerLazySingleton(() => ApiServices());
}

void main() {
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Essay Checker',
      initialRoute: LandingPage.id,
      routes: <String, WidgetBuilder>{
        LandingPage.id: (BuildContext context) => LandingPage(),
        HomePage.id: (BuildContext context) => HomePage(),
        ComparisonPage.id: (BuildContext context) => ComparisonPage(),
        ComparisonHistoryPage.id: (BuildContext context) =>
            ComparisonHistoryPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
