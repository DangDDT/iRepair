import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  final Color color;
  final String major;
  PlaceholderWidget(this.color, this.major);
  onPress(context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        children: [
          // ElevatedButton(
          //     onPressed: () => onPress(context), child: Icon(Icons.backspace)),
          Text(major),
        ],
      ),
    );
  }
}
