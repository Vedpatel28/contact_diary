import 'dart:async';
import 'package:contact_diary/utils/utils_routes_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class splasescreen extends StatefulWidget {
  const splasescreen({Key? key}) : super(key: key);

  @override
  State<splasescreen> createState() => _splasescreenState();
}

class _splasescreenState extends State<splasescreen> {

  double scal = 1;
  double trax = 1;
  double tray = 1;

  FlutterLogoStyle aniestyle = FlutterLogoStyle.markOnly;

  void changeScreen() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
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
      Navigator.of(context).pushReplacementNamed(allroutes.homepage);
      timer.cancel();
    });
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // const Spacer(flex: 1),
            Center(
              child: SpinKitWaveSpinner(
                size: 350,
                color: Colors.indigoAccent,
                curve: Curves.easeInOutQuart.flipped,
                trackColor: Colors.white,
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
                    ),
                    const SizedBox(height: 120),
                    SpinKitWaveSpinner(
                      size: 60,
                      color: Colors.blueAccent.withOpacity(0.5),
                      waveColor: Colors.blueAccent.withOpacity(0.2),
                      trackColor: Colors.blueAccent.withOpacity(0.3),
                      curve: Curves.easeInOutQuart.flipped,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            scal = 7.1;
                            trax = 0;
                            tray -= 300;
                          });
                        },
                        child: Transform.translate(
                          offset: Offset(trax,tray),
                          child: Transform.scale(
                            scale: scal,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage("https://media2.giphy.com/media/Hg8sQkUKJcUqA/200w.gif?cid=6c09b9526fztovnnr2swbxoykldl8vrvxv86zj1q91hcju8a&ep=v1_gifs_search&rid=200w.gif&ct=g"),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
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
