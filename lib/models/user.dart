class Users {
  final String uid;

  Users({this.uid});
}

class UserData {
  final String uid;
  final String courseName;
  final String scheduleType;
  final int dd;
  final int mm;
  final int yy;
  final int hr;
  final int min;

  UserData(
      {this.uid,
      this.courseName,
      this.scheduleType,
      this.dd,
      this.mm,
      this.yy,
      this.hr,
      this.min});
}
