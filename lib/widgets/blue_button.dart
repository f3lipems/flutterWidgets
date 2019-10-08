import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  String label;
  Function onPressed;
  Color color;

  BlueButton(this.label, {@required this.onPressed, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: this.color,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        onPressed: onPressed);
  }
}
