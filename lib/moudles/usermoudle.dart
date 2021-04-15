class User {
  String name, stauts;
  DateTime birthdaydate;

  int age;
  User(this.name, this.stauts, this.birthdaydate);

  void agecalculate() {
    DateTime today = DateTime.now();
    if (birthdaydate != null) {
      age = today.year - birthdaydate.year;
    }
  }
}
