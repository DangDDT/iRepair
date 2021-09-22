import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:i_repair/views/Screens/Client/Home/widgets/problem-slide-item.dart';

class ProblemSlideShow extends StatelessWidget {
  const ProblemSlideShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      margin: EdgeInsets.only(top: 0, bottom: 5, left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.amber[200]),
      child: ImageSlideshow(
        /// Width of the [ImageSlideshow].
        width: double.infinity,

        /// Height of the [ImageSlideshow].
        height: 100,

        /// The page to show when first creating the [ImageSlideshow].
        initialPage: 0,

        /// The color to paint the indicator.
        indicatorColor: Colors.black87,

        /// The color to paint behind th indicator.
        indicatorBackgroundColor: Colors.grey,

        /// The widgets to display in the [ImageSlideshow].
        /// Add the sample image file into the images folder
        children: [
          // Image.asset(
          //   'assets/images/laptop-banner.png',
          //   fit: BoxFit.fitWidth,
          // ),
          ProblemSlideItem(
              title: "Xe của bạn đang bị hỏng",
              image: "assets/images/xe-hong.jpg"),
          ProblemSlideItem(title: "Máy lạnh của bạn hết gas"),
          ProblemSlideItem(title: "Tủ lạnh không còn lạnh nữa"),
          ProblemSlideItem(title: "Bạn bị hết dung lượng SSD"),
        ],

        /// Called whenever the page in the center of the viewport changes.
        onPageChanged: (value) {},

        /// Auto scroll interval.
        isLoop: true,

        /// Do not auto scroll with null or 0.
        autoPlayInterval: 5000,
      ),
    );
  }
}
