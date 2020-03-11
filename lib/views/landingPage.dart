import 'package:essay_checker/components/navbar.dart';
import 'package:flutter/material.dart';

import '../components/DesktopView.dart';
import '../components/mobileView.dart';
import 'package:get_it/get_it.dart';

import '../models/authUser.dart';
import '../models/apiResponseData.dart';
import '../services/apiServices.dart';
import '../models/records.dart';

class LandingPage extends StatefulWidget {
  static String id = "/index";
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  ApiServices get services => GetIt.I<ApiServices>();

  final formKey = GlobalKey<FormState>();
  final user = AuthUser();
  bool isHidden = true;
  // bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 800) {
            return Column(
              children: <Widget>[
                LoginNavBar(),
                MobileView(
                    deviceData: deviceData,
                    formKey: formKey,
                    user: user,
                    isLoading: isHidden,
                    login: authenticatUser),
              ],
            );
          }
          return Column(
            children: <Widget>[
              // LoginNavBar(),
              DesktopView(
                  login: authenticatUser,
                  deviceData: deviceData,
                  formKey: formKey,
                  user: user,
                  isLoading: isHidden),
            ],
          );
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
