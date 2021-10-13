import 'package:netflix/widgets/poster.dart';
import 'package:netflix/widgets/mainview.dart';
import 'package:netflix/widgets/appbar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _isVisivleNotifier = ValueNotifier<bool>(false),
      _listNotifier = ValueNotifier<int>(4);
  ScrollController sc = ScrollController();
  bool isVisible = false;
  int _index = 0;

  @override
  void initState() {
    sc.addListener(() {
      if (sc.position.pixels == sc.position.maxScrollExtent &&
          _listNotifier.value < cat.length) {
        increase();
      }
    });
    super.initState();
  }

  List<String> cat = ["Action","Adventure","Animation","Comedy","Crime","Documentary","Drama","Family","Kids","Fantasy","History","Horror","Sci-Fi & Fantasy","Music","Mystery","News","Soap""Reality","War & Politics","Romance","Science Fiction","Talk","TV Movie","Thriller","War","Western","Action & Adventure"];

  void _onPressed() {
    _isVisivleNotifier.value = !_isVisivleNotifier.value;
  }

  void increase() {
    _listNotifier.value += 4;
  }

  @override
  void dispose() {
    _isVisivleNotifier.dispose();
    _listNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("main rebuild");
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Stack(
          children: [
            //Body
            Positioned(
              height: size.height + MediaQuery.of(context).padding.top,
              width: size.width,
              top: MediaQuery.of(context).padding.top * -1,
              child: ValueListenableBuilder<int>(
                valueListenable: _listNotifier,
                builder: (_, value, __) => ListView.builder(
                  itemCount: min(value, cat.length + 1),
                  addAutomaticKeepAlives: true,
                  itemBuilder: (context, index) {
                    if (index == 0)
                      return const MainView();
                    else
                      return CustLisView(name: cat[index - 1]);
                  },
                  controller: sc,
                ),
              ),
            ),
            AppBaar(sc: sc, myfunc: _onPressed)
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: _index,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.video_collection_outlined,
                ),
                label: "Comming Soon"),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.arrow_circle_down_outlined,
              ),
              label: "Downloads",
            )
          ],
          onTap: (index) {
            setState(() => _index = index);
          },
        ),
      ),
      ValueListenableBuilder<bool>(
        valueListenable: _isVisivleNotifier,
        builder: (_, value, __) => Visibility(
          visible: value,
          child: Container(
              margin: const EdgeInsets.all(0),
              child: ListView(
                  children: List.generate(
                      cat.length,
                      (index) => TextButton(
                          onPressed: () {},
                          child: Text(
                            cat[index],	
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          )))),
              decoration: BoxDecoration(
                color: const Color(0x00000000)
                    .withOpacity(0.8), //here i want to add opacity
              )),
        ),
      ),
      ValueListenableBuilder<bool>(
          valueListenable: _isVisivleNotifier,
          builder: (_, value, __) => Visibility(
                visible: value,
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * .9),
                  child: Center(
                    child: FloatingActionButton(
                      onPressed: _onPressed,
                      child: const Icon(
                        Icons.clear,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              )),
    ]);
  }
}
