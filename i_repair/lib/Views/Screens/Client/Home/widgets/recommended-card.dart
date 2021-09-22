import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendedCard extends StatelessWidget {
  final String image;
  final String service;
  final String company;
  final double stars;
  final double distance;
  const RecommendedCard({
    Key? key,
    required this.image,
    required this.service,
    required this.company,
    required this.stars,
    required this.distance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.all(10),
      width: 400,
      decoration: BoxDecoration(
          color: CupertinoColors.systemYellow,
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                image,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 10),
            height: 25,
            child: Text(service,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 10),
            height: 25,
            child: Text(company,
                style: TextStyle(
                  fontSize: 16,
                )),
          ),
          Row(
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 10),
                  height: 20,
                  child: Icon(
                    CupertinoIcons.star_circle,
                    color: CupertinoColors.activeOrange,
                  )),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 10),
                height: 20,
                child: Text("$stars stars",
                    style: TextStyle(
                      fontSize: 14,
                    )),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(right: 10),
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
