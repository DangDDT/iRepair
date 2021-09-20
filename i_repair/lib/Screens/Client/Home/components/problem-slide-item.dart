import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProblemSlideItem extends StatelessWidget {
  final String title;
  final String? image;
  const ProblemSlideItem({
    Key? key,
    required this.title,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () => {},
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 5),
              child: Card(
                  color: Colors.amber,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                  semanticContainer: true,
                  elevation: 5,
                  child: Container(
                    width: 230,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 5, left: 10),
                          alignment: Alignment.topLeft,
                          child: Text(title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 10),
                          margin: EdgeInsets.only(top: 30),
                          child: Text('Nhấn để xem chi tiết >>',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                        )
                      ],
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: (image != null)
                    ? Image.asset(
                        image!,
                        width: 130,
                      )
                    : Image.network("https://picsum.photos/130/100"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
