import 'package:adwattask/config/colors.dart';
import 'package:adwattask/config/provider.dart';
import 'package:adwattask/moudles/coursesmoudle.dart';
import 'package:adwattask/screens/coursescrenn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'cartwidget.dart';
import 'courseinfocard.dart';

class Coursecard extends StatefulWidget {
  const Coursecard({
    Key key,
    this.e,
    this.showbottomsheet,
  }) : super(key: key);
  final Course e;
  final Function showbottomsheet;

  @override
  _CoursecardState createState() => _CoursecardState();
}

class _CoursecardState extends State<Coursecard> {
  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0))),
              child: Cartwidget(context: context),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Coursewidget(course: widget.e),
      onTap: () {
        if (Provider.of<Userprovider>(context, listen: false)
                .cousestatuse(widget.e.start, widget.e.end) ==
            "finished") {
          HapticFeedback.mediumImpact();

          Scaffold.of(context).showSnackBar(SnackBar(
              elevation: 10,
              padding: EdgeInsets.symmetric(vertical: 10),
              backgroundColor: accentcolor,
              content: Container(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "this course is already finished",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ))));
        } else {
          if (Provider.of<Userprovider>(context, listen: false)
              .userrange(widget.e)) {
            Provider.of<Userprovider>(context, listen: false)
                .addcourse(widget.e);
            _modalBottomSheetMenu();
          } else {
            HapticFeedback.mediumImpact();

            Scaffold.of(context).showSnackBar(SnackBar(
                elevation: 10,
                padding: EdgeInsets.symmetric(vertical: 10),
                backgroundColor: accentcolor,
                content: Container(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "you are not in this course's approbite age",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ))));
          }
        }
      },
    );
  }
}
