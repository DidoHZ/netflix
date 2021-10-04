import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/widgets/photoprofile.dart';
import 'package:video_player/video_player.dart';


class ProfileMainScreen extends StatefulWidget {

  const ProfileMainScreen({Key? key, }) : super(key: key);
  static const String rout ="profilemain_screen";


  @override
  State<ProfileMainScreen> createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
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
    );
  }
}
