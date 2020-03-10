// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../components/section.dart';
import '../components/navbar.dart';

class HomePage extends StatelessWidget {
  static String id = "/home";

  // String _path;
  // Map<String, String> _paths;
  // String _extension;
  // FileType _pickType;
  // bool _isMutitPicking;

  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (BuildContext context, constrain) {
            if (constrain.maxWidth > 1200) {
              return Container(
                // height: 2 * deviceData.height,
                child: Column(
                  children: <Widget>[
                    NavBar(),
                    Sections(),
                    // Sections(),
                  ],
                ),
              );
            } else if (constrain.maxWidth > 800 && constrain.maxWidth < 1200) {
              return Container(
                // height: 2 * deviceData.height,
                child: Column(
                  children: <Widget>[
                    NavBar(),
                    Sections(),
                    // Sections(),
                  ],
                ),
              );
            } else {
              return Container(
                height: 1.5 * deviceData.height,
                child: Column(
                  children: <Widget>[
                    NavBar(),
                    Sections(),
                    // Sections(),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
