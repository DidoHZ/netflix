import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/widgets/photoprofile.dart';
import 'package:netflix/widgets/video.dart';

class VideoInfo extends StatelessWidget {
  const VideoInfo({
    Key? key,
  }) : super(key: key);

  static const String rout = "VideoInfo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Photobass(size: 30),
            ),
          ],
        ),
        body: Column(
          children: [
            const Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: VideoPlayerScreen(),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 350),
                    child: UserProfileImage(
                      size: 50,
                      imageUrl:
                          "https://upload.wikimedia.org/wikipedia/commons/1/13/Peaky_Blinders_Logo.png",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "New",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text("2021", style: TextStyle(color: Colors.white)),
                      Text("+18", style: TextStyle(color: Colors.white)),
                      Text("Limited Series",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                  const Text("Watch the Limited Series Now",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  // ElevatedButton.icon(),
                  // ElevatedButton.icon(),
                  const Text("Watch the Limited Series Now"),
                  const Text("Watch the Limited Series Now"),
                ],
              ),
            )
          ],
        ));
  }
}
