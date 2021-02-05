import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:class_guide/screens/wrapper.dart';
import 'package:class_guide/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:class_guide/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
      /*FutureBuilder(
          future: _fbApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('you have an error! ${snapshot.error.toString()}');
              return Text('something went wrong!');
            } else if (snapshot.hasData) {
              return MyHomePage(title: 'Flutter Demo Home Page');
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )*/
    );
  }
}
