import 'package:adwattask/components/courseinfocard.dart';
import 'package:adwattask/config/provider.dart';
import 'package:adwattask/screens/coursescrenn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cartwidget extends StatelessWidget {
  const Cartwidget({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;
  double sumprice() {
    print(Provider.of<Userprovider>(context).user.stauts);
    double sum = 0;
    Provider.of<Userprovider>(context).courses.forEach((element) {
      sum += element.price;
    });

    return sum;
  }

  double calculateprice() {
    print(Provider.of<Userprovider>(context).user.stauts);
    double sum = 0;
    Provider.of<Userprovider>(context).courses.forEach((element) {
      sum += element.price;
    });

    if (Provider.of<Userprovider>(context).user.stauts == "platinum")
      return sum - (sum * .10);
    else if (Provider.of<Userprovider>(context).user.stauts == "gold")
      return sum - (sum * .15);
    else
      return sum;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: Provider.of<Userprovider>(context)
                  .courses
                  .map((e) => Coursewidget(course: e))
                  .toList(),
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("net price: \$"),
                Text(calculateprice().toString()),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("discount: "),
                Text("%"),
                Text(Provider.of<Userprovider>(context).user.stauts ==
                        "platinum"
                    ? "10"
                    : Provider.of<Userprovider>(context).user.stauts == "gold"
                        ? "15"
                        : "0"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("discounted sum : \$"),
                Text((sumprice() - calculateprice()).toString()),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("total price : \$"),
                Text(calculateprice().toString()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
