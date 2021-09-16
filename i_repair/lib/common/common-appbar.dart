import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBar appBar;

  /// you can add more fields that meet your needs

  const BaseAppBar({Key? key, required this.appBar, required this.title})
      : super(key: key);
  onPress(context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)))
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
