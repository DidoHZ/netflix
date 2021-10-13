import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:netflix/main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    _navigator();
  }

  _navigator() async {
    await Future.delayed(
      const Duration(milliseconds: 1500),
    );
    Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context,a1,a2) => const MyHomePage(),
    transitionsBuilder: (context, anim, a2, child) => FadeTransition(opacity: anim, child: child),
    transitionDuration: const Duration(milliseconds: 500),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            child: SvgPicture.asset(
              "images/Netflix_2015_logo.svg",
              width: 200,
            ),
          ),
        ));
  }
}
