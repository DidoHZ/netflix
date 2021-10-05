import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix/screen/signin_screen.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const Image(image: AssetImage("images/logo.svg.png")),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text("PRIVACY",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.white))),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()));
              },
              child: const Text("SIGN IN",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.white)))
        ],
      ),
      body: Wrap(
        direction: Axis.vertical,
        children: [
          CarouselSlider(
              items: const [
                Image(image: AssetImage("images/image1.jpg")),
                Image(image: AssetImage("images/image2.jpg")),
              ],
              options: CarouselOptions(
                autoPlay: true,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                viewportFraction: 1.1,
                aspectRatio: 1 / 2,
                initialPage: 1,
              )),
        ],
      ),
    );
  }
}
