import 'package:class_guide/screens/authenticate/register.dart';
import 'package:class_guide/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:class_guide/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:class_guide/screens/home/home.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Sign_in(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
