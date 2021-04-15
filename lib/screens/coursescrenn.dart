import 'package:adwattask/components/coursecard.dart';
import 'package:adwattask/config/colors.dart';
import 'package:adwattask/config/provider.dart';
import 'package:adwattask/moudles/coursesmoudle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Coursesscreen extends StatelessWidget {
  DateFormat formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondbackgroundcolor,
        actions: [
          DropdownButton(
              hint: Text("choose age"),
              items: Provider.of<Userprovider>(
                context,
              )
                  .getallranges()
                  .map((e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: (val) {
                print(val);
                Provider.of<Userprovider>(context, listen: false).setage(val);
              })
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: Provider.of<Userprovider>(context, listen: false)
              .getallcourses()
              .map((e) => Coursecard(
                    e: e,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
