import 'dart:async';
import 'package:contact_diary/utils/utils_routes_page.dart';
import 'package:flutter/material.dart';

class splasescreen extends StatefulWidget {
  const splasescreen({Key? key}) : super(key: key);

  @override
  State<splasescreen> createState() => _splasescreenState();
}

class _splasescreenState extends State<splasescreen> {
  FlutterLogoStyle aniestyle = FlutterLogoStyle.markOnly;

  void changeScreen() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        aniestyle = FlutterLogoStyle.horizontal;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      Navigator.of(context).pushReplacementNamed(allroutes.homepage);
      timer.cancel();
    });

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset("assets/Image/splash.gif"),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
