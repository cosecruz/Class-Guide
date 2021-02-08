import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:class_guide/models/schedule.dart';
import 'package:class_guide/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference scheduleCollection =
      FirebaseFirestore.instance.collection('schedules');

  Future<void> updateUserData(String courseName, String scheduleType, int dd,
      int mm, int yy, int hr, int min) async {
    return await scheduleCollection.doc(uid).set({
      'courseName': courseName,
      'scheduleType': scheduleType,
      'day': dd,
      'month': mm,
      'year': yy,
      'hour': hr,
      'minute': min,
      //'datetime': datetime,
    });
  }

  Future<void> getCurrentUserData() async {
    try {
      DocumentSnapshot snapshot = await scheduleCollection.doc(uid).get();

      String courseName = snapshot.get('courseName');
      String scheduleType = snapshot.get('scheduleType');
      int dd = snapshot.get('day');
      int mm = snapshot.get('month');
      int yy = snapshot.get('year');
      int hr = snapshot.get('hour');
      int min = snapshot.get('minute');
    } catch (e) {
      print(e.toString());
    }
  }
  /*
   Future getCurrentUserData() async {
    try {
      DocumentSnapshot snapshot = await scheduleCollection.doc(uid).get();
      return UserData(
      courseName: snapshot.get('courseName'),
      scheduleType: snapshot.get('scheduleType'),
      dd: snapshot.get('day'),
      mm: snapshot.get('month'),
      yy: snapshot.get('year'),
      hr: snapshot.get('hour'),
      min: snapshot.get('minute'),
      );
      
    } catch (e) {
      print(e.toString());
    }
  }
   */

  List<Schedule> _scheduleListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      //print(doc.data);
      return Schedule(
        courseName: doc.data()['courseName'] ?? '',
        scheduleType: doc.data()['scheduleType'] ?? '',
        dd: doc.data()['day'] ?? 0,
        mm: doc.data()['month'] ?? 0,
        yy: doc.data()['year'] ?? 0,
        hr: doc.data()['hour'] ?? 0,
        min: doc.data()['minute'] ?? 0,
      );
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      courseName: snapshot.data()['courseName'],
      scheduleType: snapshot.data()['scheduleType'],
      dd: snapshot.data()['day'],
      mm: snapshot.data()['month'],
      yy: snapshot.data()['year'],
      hr: snapshot.data()['hour'],
      min: snapshot.data()['minute'],
    );
  }

  Stream<List<Schedule>> get schedules {
    return scheduleCollection.snapshots().map(_scheduleListFromSnapshot);
  }

  Stream<UserData> get userData {
    return scheduleCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
