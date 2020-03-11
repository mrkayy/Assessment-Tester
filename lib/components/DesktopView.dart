import 'package:essay_checker/components/navbar.dart';
import 'package:essay_checker/models/authUser.dart';
import 'package:essay_checker/views/homePage.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class DesktopView extends StatefulWidget {
  DesktopView({
    @required this.deviceData,
    @required this.formKey,
    @required this.user,
    @required this.isLoading,
    @required this.login,
  });

  Function login;
  final Size deviceData;
  final GlobalKey<FormState> formKey;
  final AuthUser user;
  bool isLoading;

  @override
  _DesktopViewState createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      // padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              // color: Colors.grey[200],
              // padding: const EdgeInsets.all(60.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  LoginDesktopNavBar(),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        width: widget.deviceData.width * 0.25,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Log in\n",
                                      style: kRichTextDefaultTextStyle.copyWith(
                                          fontSize: 32.0)),
                                  TextSpan(
                                      text:
                                          "Enter any Username and Password to login",
                                      style: kRichTextDefaultTextStyle.copyWith(
                                          fontSize: 12.0)),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Column(
                              children: <Widget>[
                                Form(
                                  key: widget.formKey,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      TextFormField(
                                        validator: (e) =>
                                            e.isEmpty ? "UserName" : null,
                                        onSaved: (val) =>
                                            widget.user.username = val,
                                        decoration:
                                            kTextFormDecoration.copyWith(
                                                hintText: 'eg: makers832',
                                                labelText: 'User Name'),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      TextFormField(
                                        validator: (e) =>
                                            e.isEmpty ? "Password" : null,
                                        onSaved: (val) =>
                                            widget.user.password = val,
                                        obscureText: widget.isLoading,
                                        decoration:
                                            kTextFormDecoration.copyWith(
                                          hintText: 'your passward',
                                          labelText: 'password',
                                          suffixIcon: widget.isLoading
                                              ? IconButton(
                                                  icon: Icon(Icons.visibility),
                                                  onPressed: () => setState(
                                                    () {
                                                      widget.isLoading =
                                                          !widget.isLoading;
                                                    },
                                                  ),
                                                )
                                              : IconButton(
                                                  icon: Icon(
                                                      Icons.visibility_off),
                                                  onPressed: () => setState(
                                                    () {
                                                      widget.isLoading =
                                                          !widget.isLoading;
                                                    },
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: FlatButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Fogot Password",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 60.0, vertical: 15.0),
                                  color: Colors.blue,
                                  child: Text(
                                    'Login',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () =>
                                      widget.login().then((result) {
                                    print(result.data.auth);
                                    print(result.data.token);
                                    Navigator.of(context)
                                        .pushReplacementNamed(HomePage.id);
                                    //Implement navigation
                                  }).catchError((err) {
                                    print(err);
                                  }),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              // width: widget.deviceData.width / 2,
              alignment: Alignment.centerRight,
              // margin: const EdgeInsets.only(right: 45.0),
              child:
                  // Stack(
                  //   children: <Widget>[
                  // RichText(
                  //   text: TextSpan(
                  //     children: [
                  //       TextSpan(
                  //         text: "Welcome\n\n",
                  //         style: kRichTextDefaultTextStyle.copyWith(
                  //             fontSize: 24.0),
                  //       ),
                  //       TextSpan(
                  //         text: "Essay Checker\n\n",
                  //         style: kRichTextDefaultTextStyle.copyWith(
                  //             fontSize: 32.0),
                  //       ),
                  //       TextSpan(
                  //         text:
                  //             "Don't rack your head trying to detect a plagarized Essay\nConfirm the authenticity of a file in 3 simple step",
                  //         style: kRichTextDefaultTextStyle.copyWith(
                  //             fontSize: 14.0),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Image.asset(
                "assets/images/loginWallpaper.jpg",
                height: widget.deviceData.height,
              ),
              //   ],
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
