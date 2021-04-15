import 'dart:math';

import 'package:adwattask/config/provider.dart';
import 'package:adwattask/moudles/usermoudle.dart';
import 'package:adwattask/screens/coursescrenn.dart';
import 'package:flutter/material.dart';

import 'package:adwattask/components/customtextfield.dart';
import 'package:adwattask/config/texts.dart';
import 'package:adwattask/config/colors.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Signupscreen extends StatefulWidget {
  @override
  _SignupscreenState createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final usernamecontroller = TextEditingController();
  final dummy = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  String password, status;
  String randomizestatus() {
    List<String> status = ["normal", "platinum", "gold"];
    return status[Random().nextInt(3)];
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1990, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        print(selectedDate);
      });
  }

  @override
  void initState() {
    dummy.text = randomizestatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xffF2FBF9),
      body: SafeArea(
        child: Container(
          color: backgroundcolor,
          child: ListView(
            children: [
              Container(
                height: 149,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 2,
                        offset: Offset(0, 0.75)),
                  ],
                  color: Color(0xffF2FBF9),
                ),
                child: Column(
                  children: [
                    Flexible(
                        child: SizedBox(
                      height: 80,
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Boldaccectcolor(
                            text: "Lets get started",
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Contenttext(
                            data: "Create an account to continue",
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: CustomTextfield(
                          controller: usernamecontroller,
                          hint: "Write your name",
                          isobscure: false,
                          label: "name",
                          priffix: Icons.person,
                          validator: 0),
                    ),
                    GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: textcolor)),
                          height: 50,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Icon(
                                  Icons.calendar_today,
                                  color: accentcolor,
                                ),
                              ),
                              Text(selectedDate.day == DateTime.now().day &&
                                      selectedDate.month ==
                                          DateTime.now().month &&
                                      selectedDate.year == DateTime.now().year
                                  ? ""
                                  : "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}")
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: CustomTextfield(
                          enabled: false,
                          controller: dummy,
                          hint: "",
                          isobscure: false,
                          priffix: Icons.check,
                          validator: 0),
                    ),
                    Signupsnackbutton(
                      formKey: _formKey,
                      usernamecontroller: usernamecontroller,
                      stringstatus: dummy.text,
                      selecteddate: selectedDate,
                    ),
                    SizedBox(
                      height: 25,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Signupsnackbutton extends StatelessWidget {
  const Signupsnackbutton(
      {Key key,
      @required GlobalKey<FormState> formKey,
      @required this.usernamecontroller,
      this.selecteddate,
      this.stringstatus})
      : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController usernamecontroller;
  final DateTime selecteddate;
  final stringstatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: FlatButton(
            color: accentcolor,
            onPressed: () {
              Text("pressed");
              if (_formKey.currentState.validate()) {
                if (selecteddate.day == DateTime.now().day &&
                    selecteddate.month == DateTime.now().month &&
                    selecteddate.year == DateTime.now().year) {
                  HapticFeedback.mediumImpact();

                  Scaffold.of(context).showSnackBar(SnackBar(
                      elevation: 10,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      backgroundColor: accentcolor,
                      content: Container(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "you cant set the date today",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ))));
                } else {
                  User x =
                      User(usernamecontroller.text, stringstatus, selecteddate);
                  x.agecalculate();
                  Provider.of<Userprovider>(context, listen: false).setuser(x);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Coursesscreen()));
                }
              } else {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Coursesscreen()));
              }
            },
            child: Text(
              "Create Account",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
