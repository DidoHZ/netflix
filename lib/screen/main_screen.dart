import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/widgets/poster.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ScrollController sc = ScrollController();
  double scrolled = 0, appbaropacity = 0, lastscroll = 0;
  int _index = 0;
  late Size size;

  @override
  void initState() {
    sc = ScrollController();
    sc.addListener(() {
      if (sc.position.pixels == sc.position.maxScrollExtent && i < cat.length) {
        setState(() {
          i += 4;
        });
      }

      double firstH = size.height * 0.075;

      if (sc.position.userScrollDirection == ScrollDirection.reverse &&
          scrolled < firstH) {
        // Handle scroll Down
        setState(() {
          scrolled =
              min(scrolled + max(sc.position.pixels - lastscroll, 1), firstH);
          appbaropacity =
              sc.position.pixels <= firstH ? (scrolled * 0.75) / firstH : 0.75;
        });
      } else if (sc.position.userScrollDirection == ScrollDirection.forward &&
          (scrolled != 0 || sc.position.pixels <= firstH)) {
        // Handle scroll up.
        setState(() {
          scrolled = max(scrolled - max(lastscroll - sc.position.pixels, 0), 0);
          appbaropacity = sc.position.pixels <= size.height * 0.075
              ? (min(sc.position.pixels, firstH) * 0.75) / firstH
              : 0.75;
        });
      }

      lastscroll = sc.position.pixels;
    });
    super.initState();
  }

  List<String> cat = [
    "Home",
    "My List",
    "Action",
    "Anime",
    "Dramas",
    "Sci-fi",
    "Stand-Up",
    "Fantasy",
    "Mafia",
    "Horror",
    "Halloween",
    "Music & Musicals",
    "Reality",
    "Romance",
    "Halloween",
    "Music & Musicals",
    "Crime",
    "Anime",
    "Dramas",
    "Stand-Up",
    "Comedies",
    "Fantasy"
  ];
  bool isVisible = false;
  void showToast() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  int i = 4;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
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
              child: ListView.builder(
                itemCount: min(i, cat.length + 1),
                itemBuilder: (context, index) {
                  if (index == 0)
                    return MainView(size: size);
                  else
                    return CustLisView(name: cat[index - 1]);
                },
                controller: sc,
              ),
            ),

            //My App bar
            Positioned(
              height: size.height * 0.125 + MediaQuery.of(context).padding.top,
              width: size.width,
              top: scrolled * -1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //First part (logo,search,profile)
                  Container(
                    height: size.height * 0.075,
                    color: Color.fromRGBO(0, 0, 0, appbaropacity),
                    child: SafeArea(
                      top: true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      child: Container(
                        color: Color.fromRGBO(0, 0, 0, appbaropacity),
                      )),
                  //Second part (Tv Shows,Movies,..)
                  Container(
                    height: size.height * 0.05,
                    color: Color.fromRGBO(0, 0, 0, appbaropacity),
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
                            onPressed: () {
                              showToast();
                            },
                            child: const Text(
                              "Catefories",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
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
      Visibility(
        visible: isVisible,
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
      Visibility(
        visible: isVisible,
        child: Padding(
          padding: EdgeInsets.only(top: size.height * .9),
          child: Center(
            child: FloatingActionButton(
              onPressed: () {
                showToast();
              },
              child: const Icon(
                Icons.clear,
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ),
      )
    ]);
  }
}

class MainView extends StatelessWidget {
  const MainView({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          SizedBox(
            height: size.height * 0.7,
            width: size.width,
            child: Image.network(
                "https://fr.web.img6.acsta.net/pictures/21/08/02/16/08/1706767.jpg",
                fit: BoxFit.fill),
          ),
          Container(
            height: size.height * 0.7,
            width: size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
          ),
          SizedBox(
            height: size.height * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Drama, Action, Crime",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                          )),
                      const Text("My List",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.w100))
                    ]),
                    Container(
                        width: size.width * 0.21,
                        height: size.height * 0.045,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: TextButton(
                            onPressed: () {},
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(Icons.play_arrow, color: Colors.black),
                                  Text("Play")
                                ],
                              ),
                            ))),
                    Column(children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.info_outline_rounded,
                          )),
                      const Text("Info",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.w100))
                    ]),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustLisView extends StatelessWidget {
  final String name;

  const CustLisView({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Poster> children = [];

    children = List.generate(
        10,
        (index) => const Poster(
            image:
                "https://i.pinimg.com/originals/af/34/1e/af341e79a94853eb03fb149f3cfbe509.jpg",
            title: "Peaky Blinders",
            description:
                "Birmingham, England, in 1919, several months after the end of the First World War in November 1918. The story centres on the Peaky Blinders gang and their ambitious and highly cunning boss Tommy Shelby (Murphy)"));

    return Container(
        height: size.height * 0.25,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                name,
                style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 7,
              ),
              SizedBox(
                  width: size.width,
                  height: size.height * .20,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: children,
                  ))
            ])));
  }
}
