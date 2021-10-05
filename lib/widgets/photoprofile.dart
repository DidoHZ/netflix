import 'package:flutter/material.dart';
import 'package:netflix/screen/main_screen.dart';

class UserProfileImage extends StatelessWidget {
  final String imageUrl;
  final String name;

  final double size, a = 0;

  const UserProfileImage({
    Key? key,
    this.imageUrl =
        "https://i.pinimg.com/originals/91/6c/61/916c610076e3e6b4ed3ad215478a020b.png",
    required this.size,
    required,
    this.name = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
          (Route<dynamic> route) => false),
      child: Column(
        children: [
          Photobass(imageUrl: imageUrl, size: size),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

class Photobass extends StatelessWidget {
  const Photobass({
    Key? key,
    this.imageUrl =
        "https://i.pinimg.com/originals/91/6c/61/916c610076e3e6b4ed3ad215478a020b.png",
    required this.size,
  }) : super(key: key);

  final String imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2 - size / 10),
      child: Image.network(
        imageUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
