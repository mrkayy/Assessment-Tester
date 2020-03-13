import 'package:essay_checker/models/authUser.dart';
import 'package:essay_checker/views/homePage.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class MobileView extends StatefulWidget {
  MobileView({
    @required this.loading,
    @required this.deviceData,
    @required this.formKey,
    @required this.user,
    @required this.login,
  });

  Function login;

  final Size deviceData;
  final GlobalKey<FormState> formKey;
  final AuthUser user;
  bool loading;

  @override
  _MobileViewState createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.deviceData.height * 0.8,
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        width: widget.deviceData.width * 0.75,
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
                      style:
                          kRichTextDefaultTextStyle.copyWith(fontSize: 32.0)),
                  TextSpan(
                      text: "Enter any Username and Password to login",
                      style:
                          kRichTextDefaultTextStyle.copyWith(fontSize: 12.0)),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Column(
              children: <Widget>[
                Form(
                  key: widget.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormField(
                        validator: (e) => e.isEmpty ? "UserName" : null,
                        onSaved: (val) => widget.user.username = val,
                        decoration: kTextFormDecoration.copyWith(
                            hintText: 'eg: makers832', labelText: 'User Name'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        validator: (e) => e.isEmpty ? "Password" : null,
                        onSaved: (val) => widget.user.password = val,
                        obscureText: isLoading,
                        decoration: kTextFormDecoration.copyWith(
                            hintText: 'your passward',
                            labelText: 'password',
                            suffixIcon: isLoading
                                ? IconButton(
                                    icon: Icon(Icons.visibility),
                                    onPressed: () => setState(() {
                                          isLoading = !isLoading;
                                        }))
                                : IconButton(
                                    icon: Icon(Icons.visibility_off),
                                    onPressed: () => setState(() {
                                          isLoading = !isLoading;
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
                    if (result.error) {
                      print('Error occured! Please reload');
                      setState(() {
                        widget.loading = !widget.loading;
                      });
                    } else {
                      setState(() {
                        widget.loading = !widget.loading;
                      });
                      print(result.data.auth);
                      print(result.data.token);
                      Navigator.of(context).pushReplacementNamed(HomePage.id);
                      //Implement navigation
                    }
                  }).catchError((err) {
                    print(err);
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
