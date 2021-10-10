import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_repair/Models/Constants/constants.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? content;
  final AppBar appBar;
  final bool haveBackSpace;

  /// you can add more fields that meet your needs

  const BaseAppBar(
      {Key? key,
      required this.appBar,
      this.title,
      required this.haveBackSpace,
      this.content})
      : super(key: key);
  onPress(context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: haveBackSpace,
      backgroundColor: kPrimaryColor,
      title: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: Text((title == null) ? '' : title!,
                      style: TextStyle(color: kBackgroundColor))),
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
