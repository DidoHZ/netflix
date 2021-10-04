import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/widgets/photoprofile.dart';
import 'package:netflix/widgets/video.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';




















class VideoInfo extends StatefulWidget {

  const VideoInfo({Key? key, }) : super(key: key);
  static const String rout ="VideoInfo";


  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: photobass(size:30),
          ),

        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: VideoPlayerScreen(),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 350),
                  child: UserProfileImage(size: 50,imageUrl: "https://upload.wikimedia.org/wikipedia/commons/1/13/Peaky_Blinders_Logo.png",),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("New",style: TextStyle(color: Colors.white),),
                    Text("2021",style: TextStyle(color: Colors.white)),
                    Text("+18",style: TextStyle(color: Colors.white)),
                    Text("Limited Series",style: TextStyle(color: Colors.white))
                  ],
                ),
             Text("Watch the Limited Series Now",style: TextStyle(color: Colors.white,fontSize: 20)),
              //  ElevatedButton.icon(),
            //    ElevatedButton.icon(),
                Text("Watch the Limited Series Now"),
                Text("Watch the Limited Series Now"),
                Row(),

              ],
            ),
          )
        ],
      )
    );
  }
}
