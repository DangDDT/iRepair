import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: CupertinoColors.activeOrange.withOpacity(0.7),
      title: Row(
        children: [
          Container(
              width: 50,
              // margin: EdgeInsets.only(top: 10),
              child: Image.asset(
                ("assets/images/personal-icon.png"),
                height: 50,
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text((title == null) ? '' : title!,
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text((content == null) ? '' : content!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 10))),
            ],
          )
        ],
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications),
          tooltip: 'Show Snackbar',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
