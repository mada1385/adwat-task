import 'package:adwattask/config/provider.dart';
import 'package:adwattask/moudles/coursesmoudle.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Coursewidget extends StatelessWidget {
  Coursewidget({
    Key key,
    this.course,
  }) : super(key: key);

  DateFormat formatter = DateFormat('yyyy-MM-dd');
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Card(
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(course.name),
            trailing: Text("\$ ${course.price}"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "${Provider.of<Userprovider>(context).cousestatuse(course.start, course.end)}"),
                Text(
                    "from ${formatter.format(course.start)} to ${formatter.format(course.end)}"),
                Text(
                    "age from ${course.agerange.leastage} to ${course.agerange.mostage}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
