import 'package:essay_checker/components/DesktopView.dart';
import 'package:essay_checker/components/mobileView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';

import '../models/authUser.dart';
import '../models/apiResponseData.dart';
import '../services/apiServices.dart';
import './homePage.dart';
import '../models/records.dart';
import '../constants.dart';

class LandingPage extends StatefulWidget {
  static String id = "/index";
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  ApiServices get services => GetIt.I<ApiServices>();

  APIResponse<List<Records>> _apiResponse;

  void getRecords() async {
    _apiResponse = await services.getAssessmentRecord();
  }

  final formKey = GlobalKey<FormState>();
  final user = AuthUser();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context).size;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1200) {
            return DesktopView(
                login: authenticatUser,
                deviceData: deviceData,
                formKey: formKey,
                user: user,
                isLoading: isLoading);
          } else if (constraints.maxWidth > 800 &&
              constraints.maxWidth < 1200) {
            return DesktopView(
                login: authenticatUser,
                deviceData: deviceData,
                formKey: formKey,
                user: user,
                isLoading: isLoading);
          } else {
            return MobileView(
                deviceData: deviceData,
                formKey: formKey,
                user: user,
                isLoading: isLoading,
                login: authenticatUser);
          }
          return DesktopView(
              login: authenticatUser,
              deviceData: deviceData,
              formKey: formKey,
              user: user,
              isLoading: isLoading);
        },
      ),
    );
  }

  Future<APIResponse<Token>> authenticatUser() async {
    var finalResult;
    final formstatus = formKey.currentState;
    if (formstatus.validate()) {
      formstatus.save();
      var newUser = AuthUser(username: user.username, password: user.password);
      finalResult = await services.loginUser(newUser);
      // finalResult = isAuthenticated.data;
      return finalResult;
    }
    return finalResult;
  }
}
