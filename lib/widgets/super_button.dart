import 'package:flutter/material.dart';

class SuperButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color? color;

  SuperButton({
    required this.text, 
    required this.onPressed, 
    this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(16),
          elevation: 8,
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          )
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16.0,
          color: Colors.white,
        ),
       ),
       onPressed: onPressed as void Function()?,
      ),
    );
  }
}
