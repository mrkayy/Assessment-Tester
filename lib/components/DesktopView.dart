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
          Container(
            // color: Colors.grey[200],
            padding: const EdgeInsets.all(80.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/images/3-Line-Logo-2-p-500.png",
                    width: 180,
                    // height: 200,
                  ),
                ),
                SizedBox(height: 10.0),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Login\n\n",
                          style: kRichTextDefaultTextStyle.copyWith(
                              fontSize: 32.0)),
                      TextSpan(
                          text:
                              "To Login Please enter any Username and Password",
                          style: kRichTextDefaultTextStyle),
                    ])),
                Container(
                  padding: const EdgeInsets.only(top: 50.0),
                  width: 0.25 * widget.deviceData.width,
                  child: Column(
                    children: <Widget>[
                      Form(
                        key: widget.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            TextFormField(
                              validator: (e) =>
                                  e.isEmpty ? "please enter userName" : null,
                              onSaved: (val) => widget.user.username = val,
                              decoration: kTextFormDecoration.copyWith(
                                  labelText: 'User Name'),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              validator: (e) =>
                                  e.isEmpty ? "please enter password" : null,
                              onSaved: (val) => widget.user.password = val,
                              obscureText: widget.isLoading,
                              decoration: kTextFormDecoration.copyWith(
                                  labelText: 'password',
                                  suffixIcon: widget.isLoading
                                      ? IconButton(
                                          icon: Icon(Icons.visibility),
                                          onPressed: () => setState(() {
                                                widget.isLoading =
                                                    !widget.isLoading;
                                              }))
                                      : IconButton(
                                          icon: Icon(Icons.visibility_off),
                                          onPressed: () => setState(() {
                                                widget.isLoading =
                                                    !widget.isLoading;
                                              }))),
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
                        onPressed: () => widget.login().then((result) {
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
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 45.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Welcome\n\n",
                          style: kRichTextDefaultTextStyle.copyWith(
                              fontSize: 24.0),
                        ),
                        TextSpan(
                          text: "Essay Checker\n\n",
                          style: kRichTextDefaultTextStyle.copyWith(
                              fontSize: 32.0),
                        ),
                        TextSpan(
                          text:
                              "Don't rack your head trying to detect a plagarized Essay\nConfirm the authenticity of a file in 3 simple step",
                          style: kRichTextDefaultTextStyle.copyWith(
                              fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/fs-graphic.png",
                    height: 0.42 * widget.deviceData.height,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
