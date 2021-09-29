import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_repair/Models/Constants/constants.dart';

class RecommendedCard extends StatelessWidget {
  final String image;
  final String service;
  final String? company;
  final double stars;
  final double distance;
  const RecommendedCard({
    Key? key,
    required this.image,
    required this.service,
    this.company,
    required this.stars,
    required this.distance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 200,
      margin: EdgeInsets.only(left: 10, right: 15, top: 20, bottom: 20),
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: kPrimaryLightColor, borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                image,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: size.width * 0.05, bottom: 10),
            height: 25,
            child: Text(service,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          (company != null)
              ? Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: size.width * 0.05),
                  height: 25,
                  child: Text(company!,
                      style: TextStyle(
                        fontSize: 16,
                      )),
                )
              : SizedBox(
                  height: 0,
                ),
          Row(
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: size.width * 0.05),
                  height: 20,
                  child: Icon(
                    CupertinoIcons.star_circle,
                    color: kErrorColor,
                  )),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: size.width * 0.02),
                height: 20,
                child: Text("$stars / 5.0 stars",
                    style: TextStyle(
                      fontSize: 14,
                    )),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(right: size.width * 0.05),
                  height: 20,
                  child: Text("Cách $distance km",
                      style: TextStyle(
                        fontSize: 14,
                      )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
