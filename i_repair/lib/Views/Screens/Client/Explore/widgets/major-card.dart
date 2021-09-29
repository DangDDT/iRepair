import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_repair/Controllers/majorController/majorController.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Views/Screens/Client/Explore/widgets/select_card.dart';

class MajorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MajorController majorController = Get.put(MajorController());
    return Stack(children: [
      Container(
        // alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 110,
        child: SizedBox(
          height: 100,
          child: GridView.count(
              scrollDirection: Axis.horizontal,
              crossAxisCount: 1,
              mainAxisSpacing: 5,
              children:
                  List.generate(majorController.majorList.length, (index) {
                return SelectCard(choice: majorController.majorList[index]);
              })),
        ),
      ),
    ]);
  }
}
