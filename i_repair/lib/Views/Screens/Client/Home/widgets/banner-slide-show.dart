import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class BannerSlideShow extends StatelessWidget {
  const BannerSlideShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      /// Width of the [ImageSlideshow].
      width: double.infinity,

      /// Height of the [ImageSlideshow].
      height: 200,

      /// The page to show when first creating the [ImageSlideshow].
      initialPage: 0,

      /// The color to paint the indicator.
      indicatorColor: Colors.black87,

      /// The color to paint behind th indicator.
      indicatorBackgroundColor: Colors.grey,

      /// The widgets to display in the [ImageSlideshow].
      /// Add the sample image file into the images folder
      children: [
        Image.asset(
          'assets/images/laptop-banner.png',
          fit: BoxFit.fitWidth,
        ),
      ],

      /// Called whenever the page in the center of the viewport changes.
      onPageChanged: (value) {},

      /// Auto scroll interval.
      isLoop: true,

      /// Do not auto scroll with null or 0.
      autoPlayInterval: 3000,
    );
  }
}
