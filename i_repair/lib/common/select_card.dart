import 'package:flutter/material.dart';
import 'package:i_repair/Models/Major/major.dart';
import 'package:i_repair/Screens/Client/Field/field_screen.dart';
import 'package:i_repair/constaints.dart';
import 'package:page_transition/page_transition.dart';

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Major choice;
  // onPress(context) {
  //   Navigator.push(
  //       context,
  //       PageTransition(
  //           duration: Duration(milliseconds: 200),
  //           reverseDuration: Duration(milliseconds: 200),
  //           child: FieldScreen(choice.title),
  //           type: PageTransitionType.fade));
  // }

  @override
  Widget build(BuildContext context) {
    // final TextStyle? textStyle = Theme.of(context).textTheme.bodyText1;
    return Column(
      children: [
        Container(
          height: 100,
          margin: EdgeInsets.only(top: 5, left: 10),
          padding: EdgeInsets.all(2),
          child: Card(
            color: kPrimaryColor,
            elevation: 10,
            semanticContainer: true,
            borderOnForeground: false,
            shape: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(25)),
            child: Container(
              padding: EdgeInsets.all(5),
              child: InkWell(
                  onTap: () => {}, // onPress(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 50,
                            constraints: BoxConstraints(minWidth: 200),
                            child: Card(
                              shadowColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide.none,
                              ),
                              elevation: 5,
                              color: Colors.amber,
                            ),
                          ),
                          Positioned(
                            top: -25,
                            left: -5,
                            child: Image.asset(
                              (choice.imageLink),
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          choice.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: 'SpaceMono'),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
