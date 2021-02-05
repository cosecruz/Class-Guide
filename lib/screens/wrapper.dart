import 'package:class_guide/models/user.dart';
import 'package:class_guide/screens/authenticate/authenticate.dart';
import 'package:class_guide/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
    /*title: 'CLASS GUIDE',
      theme: ThemeData(
        accentColor: Colors.blue,
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
      ),
      home: Sign_in(),
    );*/
  }
}
