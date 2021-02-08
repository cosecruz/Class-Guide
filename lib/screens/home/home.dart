import 'package:class_guide/screens/home/schedule_list.dart';
import 'package:class_guide/services/auth.dart';
import 'package:class_guide/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:class_guide/models/schedule.dart';
import 'package:class_guide/screens/home/adding_form.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showAddPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
              child: AddingForm(),
              color: Colors.blue[400],
            );
          });
    }

    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: Text('bottom sheet'),
            );
          });
    }

    return StreamProvider<List<Schedule>>.value(
      value: DatabaseService().schedules,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('CLASS GUIDE'),
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: ScheduleList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddPanel(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
