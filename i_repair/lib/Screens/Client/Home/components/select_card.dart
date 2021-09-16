import 'package:flutter/material.dart';
import 'package:i_repair/Screens/Client/Field/field_screen.dart';
import 'package:page_transition/page_transition.dart';

class Choice {
  const Choice({required this.title, required this.imageLink});
  final String title;
  final String imageLink;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Plumber', imageLink: "assets/images/plumber.png"),
  const Choice(title: 'Locksmith', imageLink: "assets/images/locksmith.png"),
  const Choice(title: 'Laptop', imageLink: "assets/images/laptop-man.png"),
  const Choice(title: 'Car/Motor', imageLink: "assets/images/motorbike.png"),
  const Choice(
      title: 'Cleaning', imageLink: "assets/images/cleaning-tools.png"),
  const Choice(
      title: 'Conditioner', imageLink: "assets/images/air-conditioner.png"),
  const Choice(title: 'House', imageLink: "assets/images/house-renovation.png"),
  const Choice(title: 'Electrical', imageLink: "assets/images/appliances.png"),
  const Choice(title: 'Delivery', imageLink: "assets/images/delivery-man.png")
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;
  onPress(context) {
    Navigator.push(
        context,
        PageTransition(
            duration: Duration(milliseconds: 200),
            reverseDuration: Duration(milliseconds: 200),
            child: FieldScreen(choice.title),
            type: PageTransitionType.fade));
  }

  @override
  Widget build(BuildContext context) {
    // final TextStyle? textStyle = Theme.of(context).textTheme.bodyText1;
    return Column(
      children: [
        Expanded(
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () => onPress(context),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color(0xffE63B2E).withOpacity(0.82))),
                          child: Image.asset(
                            (choice.imageLink),
                            width: 100,
                            height: 100,
                          )),
                    ),
                  ]),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
              // side: BorderSide(
              //     style: BorderStyle.solid, width: 2, color: Colors.black87),
            ),
            margin: EdgeInsets.only(top: 5, bottom: 0, left: 10, right: 12),
            shadowColor: Colors.grey,
          ),
        ),
        Container(
          height: 25,
          child: Text(
            choice.title,
            style: TextStyle(
                // shadows: [
                //   Shadow(
                //       color: Colors.black.withOpacity(0.6),
                //       offset: Offset(4, 4),
                //       blurRadius: 10),
                // ],
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: 'SpaceMono'),
          ),
        )
      ],
    );
  }
}
