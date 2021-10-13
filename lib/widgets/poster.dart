import 'package:netflix/api/data.dart';
import 'package:netflix/screen/videoinfo.dart';
import 'package:netflix/api/myapi.dart';

import 'package:flutter/material.dart';

class Poster extends StatefulWidget {
  const Poster({Key? key, required this.id, required this.type})
      : super(key: key);

  final String type, id;

  @override
  _PosterState createState() => _PosterState();
}

class _PosterState extends State<Poster> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(widget.id+" , "+widget.type);
    return FutureBuilder<Data>(
        future: details(widget.id, widget.type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SizedBox(
                width: MediaQuery.of(context).size.width * 0.28,
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: const Duration(seconds: 5),
                        backgroundColor: Colors.grey[840],
                        content: SizedBox(
                          height: size.height * 0.4,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.network(
                                        snapshot.data!.poster,
                                        width: size.width * 0.33,
                                        height: size.height * 0.28,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.5,
                                      child: Column(
                                        children: [
                                          Text(
                                            snapshot.data!.title,
                                            style: const TextStyle(
                                                fontSize: 21,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            snapshot.data!.description,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MaterialButton(
                                      color: Colors.white,
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: const [
                                          Icon(Icons.play_arrow,
                                              color: Colors.black),
                                          Text("Play")
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.download_sharp,
                                          color: Colors.white,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.play_arrow_outlined,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                                MaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => VideoInfo(
                                                  id: widget.id,
                                                  type: widget.type)));
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: const [
                                            Icon(
                                              Icons.info_outline_rounded,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                            Text("Episodes&Info",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        ),
                                        const Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                        )
                                      ],
                                    ))
                              ]),
                        )));
                  },
                  child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(9)),
                      margin: const EdgeInsets.only(right: 10),
                      width: size.width * .27,
                      height: size.height * .20,
                      child: Image.network(
                        snapshot.data!.poster,
                        fit: BoxFit.cover,
                      )),
                ));
          } else {
            return SizedBox(width: MediaQuery.of(context).size.width * 0.28);
          }
        });
  }
}

class CustLisView extends StatefulWidget {
  final String name;

  const CustLisView({Key? key, required this.name}) : super(key: key);

  @override
  _CustLisViewState createState() => _CustLisViewState();
}

class _CustLisViewState extends State<CustLisView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    print("rebuild CustLisView");
    Size size = MediaQuery.of(context).size;
    //List<Poster> children = [];

    //children = List.generate(10, (index) => Poster(id: widget.name));

    return FutureBuilder<List<List<String>>>(
        future: getCat(type: "all", cat: getGenerId(widget.name)),
        builder: (context, AsyncSnapshot<List<List<String>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
                height: size.height * 0.25,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
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
                                  children: List.generate(
                                    10,
                                    (index) => Poster(
                                        id: snapshot.data![index][0],
                                        type: snapshot.data![index][1]),
                                  )))
                        ])));
          } else {
            return Container(
                height: size.height * 0.25,
                margin: const EdgeInsets.symmetric(vertical: 10));
          }
        });
  }

  @override
  bool get wantKeepAlive => true;
}
