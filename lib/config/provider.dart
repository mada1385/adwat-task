import 'package:adwattask/moudles/coursesmoudle.dart';
import 'package:adwattask/moudles/usermoudle.dart';
import 'package:flutter/material.dart';

class Userprovider extends ChangeNotifier {
  String age = " ";
  User user;
  Courses x = Courses();
  List<Course> courses = List<Course>();
  void setuser(User userindex) {
    user = userindex;
    notifyListeners();
  }

  void setage(String userindex) {
    print("user $userindex");
    age = userindex;
    notifyListeners();
  }

  void addcourse(Course userindex) {
    courses.add(userindex);
    print(userindex.name);
    notifyListeners();
  }

  String cousestatuse(DateTime start, DateTime end) {
    DateTime datenow = DateTime.now();
    if (datenow.compareTo(start) > 0 && datenow.compareTo(end) < 0) {
      return "in progress";
    }

    if (datenow.compareTo(start) > 0 && datenow.compareTo(end) > 0) {
      return "finished";
    } else
      return "is not started";
  }

  bool userrange(Course x) {
    DateTime datenow = DateTime.now();
    if (user.age >= x.agerange.leastage && user.age <= x.agerange.mostage) {
      return true;
    } else
      return false;
  }

  List<String> getallranges() {
    List<String> ages = ["all categories"];
    x.courses.forEach((element) {
      if (!ages.contains(element.agerange.rangestring)) {
        ages.add(element.agerange.rangestring);
      }
    });
    return ages;
  }

  List<Course> getallcourses() {
    if (age == " " || age == "all categories") {
      return x.courses;
    } else
      return x.courses
          .where((element) => element.agerange.rangestring == age)
          .toList();
  }
}
