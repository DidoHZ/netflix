import 'package:flutter/material.dart';
import 'package:netflix/screen/main_screen.dart';

class Profile extends StatefulWidget {
  String name, image;
  Profile({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 130,
          width: 130,
          //color: Colors.red,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: GestureDetector(
            child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Image.network(
                  "https://mir-s3-cdn-cf.behance.net/project_modules/disp/84c20033850498.56ba69ac290ea.png",
                )),
            onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
                (Route<dynamic> route) => false),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          widget.name,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
