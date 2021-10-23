import 'package:flutter/material.dart';
import 'package:i_repair/Models/Constants/constants.dart';

class CommentWidget extends StatelessWidget {
  final String time;
  final String customer;
  final int stars;
  final String comment;
  final int sameStar;
  const CommentWidget(
      {Key? key,
      required this.customer,
      required this.stars,
      required this.comment,
      required this.time,
      required this.sameStar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 100,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(child: Text(time, style: TextStyle(fontSize: 11))),
              Row(
                children: [
                  Container(
                      child: Text(customer,
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: kSecondaryColor,
                      size: 14,
                    ),
                    Icon(
                      Icons.star,
                      color: kSecondaryColor,
                      size: 14,
                    ),
                    Icon(
                      Icons.star,
                      color: kSecondaryColor,
                      size: 14,
                    ),
                    Icon(
                      Icons.star,
                      color: kSecondaryColor,
                      size: 14,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.grey,
                      size: 14,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text('($sameStar người cùng đánh giá)',
                            style: TextStyle(fontSize: 11))),
                  ],
                ),
              ),
              Text(comment)
            ],
          ),
        ),
      ),
    );
  }
}
