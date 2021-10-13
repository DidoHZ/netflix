import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

import 'dart:math';

class AppBaar extends StatefulWidget {
  final ScrollController sc;
  final VoidCallback myfunc;
  const AppBaar({Key? key, required this.sc, required this.myfunc}) : super(key: key);

  @override
  _AppBaarState createState() => _AppBaarState();
}

class _AppBaarState extends State<AppBaar> {
  final scrolled = ValueNotifier<double>(0),
      appbaropacity = ValueNotifier<double>(0);
  double lastscroll = 0;
  late Size size;

  @override
  void initState() {
    widget.sc.addListener(() {
      double firstH = size.height * 0.075;

      if (widget.sc.position.userScrollDirection == ScrollDirection.reverse &&
          scrolled.value < firstH) {
        // Handle scroll Down
        scrolled.value = min(
            scrolled.value + max(widget.sc.position.pixels - lastscroll, 1),
            firstH);
        appbaropacity.value = widget.sc.position.pixels <= firstH
            ? (scrolled.value * 0.75) / firstH
            : 0.75;
      } else if (widget.sc.position.userScrollDirection ==
              ScrollDirection.forward &&
          (scrolled.value != 0 || widget.sc.position.pixels <= firstH)) {
        // Handle scroll up.
        scrolled.value = max(
            scrolled.value - max(lastscroll - widget.sc.position.pixels, 0), 0);
        appbaropacity.value = widget.sc.position.pixels <= size.height * 0.075
            ? (min(widget.sc.position.pixels, firstH) * 0.75) / firstH
            : 0.75;
      }

      lastscroll = widget.sc.position.pixels;
    });
    super.initState();
  }

  @override
  void dispose() {
    scrolled.dispose();
    appbaropacity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("AppBar rebuild");
    size = MediaQuery.of(context).size;
    //My App bar
    return ValueListenableBuilder<double>(
        valueListenable: scrolled,
        builder: (_, value, __) => Positioned(
              height: size.height * 0.125 + MediaQuery.of(context).padding.top,
              width: size.width,
              top: value * -1,
              child: ValueListenableBuilder<double>(
                  valueListenable: appbaropacity,
                  builder: (_, v, __) => Container(
                      color: Color.fromRGBO(0, 0, 0, v),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //First part (logo,search,profile)
                          SizedBox(
                            height: size.height * 0.075,
                            child: SafeArea(
                              top: true,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.new_releases,
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.search,
                                      ),
                                      SizedBox(width: 15),
                                      Icon(
                                        Icons.person,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).padding.top,
                          ),
                          //Second part (Tv Shows,Movies,..)
                          SizedBox(
                            height: size.height * 0.05,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "Tv Shows",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Text(
                                  "Movies",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                TextButton(
                                    onPressed: widget.myfunc,
                                    child: const Text(
                                      "Categories",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )),
                              ],
                            ),
                          )
                        ],
                      ))),
            ));
  }
}
