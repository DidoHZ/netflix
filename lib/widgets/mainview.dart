import 'package:netflix/api/data.dart';
import 'package:netflix/api/myapi.dart';

import 'package:flutter/material.dart';
import 'package:netflix/screen/videoinfo.dart';

class MainView extends StatefulWidget {
  const MainView({
    Key? key,
  }) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with AutomaticKeepAliveClientMixin {
    
  late Data data;
    
  Future<void> fetch() async {
     data = await getTrends(type: "any", top: true);
     print("loded.");
  }
    
  @override
  Widget build(BuildContext context) {
    print("rebuild MainView");
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
        future: fetch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
          return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          SizedBox(
            height: size.height * 0.7,
            width: size.width,
            child: Image.network(data.poster, fit: BoxFit.fill),
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
                Text(
                  (data.geners as List<dynamic>).map((x) => geners[x]).join(", "),
                  style: const TextStyle(color: Colors.white),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.play_arrow, color: Colors.black),
                              Text("Play")
                            ],
                          ),
                        )),
                    Column(children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        VideoInfo(id: data.id,type: data.type)));
                          },
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
    }else{
    	return SizedBox(
            height: size.height * 0.7,
            width: size.width,
            child: const Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            )),
          );
    }
    
    });
  }

  @override
  bool get wantKeepAlive => true;
}
