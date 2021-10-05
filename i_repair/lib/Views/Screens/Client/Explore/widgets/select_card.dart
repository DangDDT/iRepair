import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/Major/major.dart';

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Major choice;
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
            color: kPrimaryLightColor,
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
                              color: kBackgroundColor,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 15,
                            child: (choice.imageUrl != "none")
                                ? SvgPicture.asset(
                                    choice.imageUrl!,
                                    height: 50,
                                  )
                                : SvgPicture.asset(
                                    "assets/images/default-icon.svg",
                                    height: 50,
                                  ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          choice.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
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
