import 'package:flutter/material.dart';

class backbutton extends StatelessWidget {
  const backbutton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.arrow_back_ios_new_rounded),
    );
  }
}
