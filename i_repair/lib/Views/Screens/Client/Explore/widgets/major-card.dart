import 'package:flutter/material.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/Major/major.dart';
import 'package:i_repair/Views/Screens/Client/Explore/widgets/select_card.dart';

class MajorCard extends StatefulWidget {
  const MajorCard({
    Key? key,
  }) : super(key: key);

  @override
  _MajorCardState createState() => _MajorCardState();
}

class _MajorCardState extends State<MajorCard> {
  List<Major> choices = Major.getMajorList;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        // alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 110,
        child: GridView.count(
            scrollDirection: Axis.horizontal,
            crossAxisCount: 1,
            mainAxisSpacing: 5,
            children: List.generate(choices.length, (index) {
              // return Center(
              return SelectCard(choice: choices[index]);
              // );
            })),
      ),
      // Positioned(
      //   top: 5,
      //   left: 30,
      //   child: Container(
      //       height: 40,
      //       color: Colors.transparent,
      //       child: Text('MAJOR',
      //           style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
      // )
    ]);
  }
}
