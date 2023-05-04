import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class splasescreen extends StatefulWidget {
  const splasescreen({Key? key}) : super(key: key);

  @override
  State<splasescreen> createState() => _splasescreenState();
}

class _splasescreenState extends State<splasescreen> {
  FlutterLogoStyle aniestyle = FlutterLogoStyle.markOnly;

  void changeScreen() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
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
    Timer.periodic(const Duration(seconds: 3), (timer) {
      // Navigator.of(context).pushReplacementNamed(allroutes.homepage);
      // timer.cancel();
    });
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // const Spacer(flex: 1),
            const Center(
              child: SpinKitWaveSpinner(
                size: 350,
                color: Colors.indigoAccent,
              ),
            ),
            // const Spacer(),
            Row(
              children: [
                const SizedBox(width: 55),
                Column(
                  children: [
                    const SizedBox(height: 272),
                    Container(
                      height: 300,
                      width: 300,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/Image/splash.gif"),
                        ),
                      ),
                      // child: Image.asset("assets/Image/splash.gif", fit: BoxFit.cover),
                    ),
                  ],
                ),
              ],
            ),
            // const Spacer(),
          ],
        ),
      ),
    );
  }
}
