import 'package:flutter/material.dart';

SnackBar errorsnackBar({required String text, required Color color}) {
  return SnackBar(
    duration: const Duration(seconds: 3),
    behavior: SnackBarBehavior.fixed,
    backgroundColor: color,
    shape: const RoundedRectangleBorder(
      side: BorderSide(
        color: Colors.white,
        style: BorderStyle.solid,
        width: 2,
      ),
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(5),
        top: Radius.elliptical(5, 40),
      ),
    ),
    content: Text(text),
    elevation: 4,
    // margin: const EdgeInsets.all(20),
  );
}
