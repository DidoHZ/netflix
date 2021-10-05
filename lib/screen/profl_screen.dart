import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix/widgets/photoprofile.dart';

class ProfileScreen extends StatelessWidget {
  static const String rout = "nikmok_screen"; //hicham did this ._.

  final String userID;

  const ProfileScreen({Key? key, required this.userID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //List<String> profiles =  ["Hicham","Dido","Asma","Kadiro","Sido"];

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Center(
              child: SvgPicture.asset(
            "images/Netflix_2015_logo.svg",
            width: 100,
          )),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.mode_edit)),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Qui est-ce ?",
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                //  Profile(name: "Dido",image: "",),Profile(name: "Hicham",image: "",)
                UserProfileImage(
                  name: "hicham",
                  size: 80,
                ),
                UserProfileImage(
                  name: "asma",
                  size: 80,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                UserProfileImage(
                  name: "imad",
                  size: 80,
                ),
                UserProfileImage(
                  name: "sido",
                  size: 80,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                UserProfileImage(
                  name: "kadiro",
                  size: 80,
                ),
              ],
            )
          ],
        ));
  }
}
