class Course {
  String name;
  DateTime start, end;
  Agerange agerange;
  double price;

  Course(this.name, this.price, this.agerange, this.start, this.end);
}

class Agerange {
  int leastage, mostage;
  String rangestring;

  Agerange(this.leastage, this.mostage, this.rangestring);
}

class Courses {
  List<Course> courses = [
    Course(
        "flutter",
        14.5,
        Agerange(10, 14, "10-14"),
        DateTime.parse("2020-06-17T03:18:31.177769-04:00"),
        DateTime.parse("2020-07-18T03:18:31.177769-04:00")),
    Course(
        "dart",
        14.5,
        Agerange(15, 19, "15-19"),
        DateTime.parse("2020-07-17T03:18:31.177769-04:00"),
        DateTime.parse("2021-07-17T03:18:31.177769-04:00")),
    Course(
        "firebase",
        14.5,
        Agerange(20, 24, "20-24"),
        DateTime.parse("2021-07-17T03:18:31.177769-04:00"),
        DateTime.parse("2021-09-17T03:18:31.177769-04:00")),
  ];
}
