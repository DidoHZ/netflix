import 'package:flutter/material.dart';
import 'package:netflix/screen/videoinfo.dart';

class Poster extends StatefulWidget {
  const Poster({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image;
  final String title;
  final String description;

  @override
  _PosterState createState() => _PosterState();
}

class _PosterState extends State<Poster> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.28,
        child: GestureDetector(
          onTap: () {
            Scaffold.of(context).showSnackBar(SnackBar(
                duration: const Duration(seconds: 20),
                backgroundColor: Colors.grey[840],
                content: SizedBox(
                  width: size.width * 0.3,
                  height: size.height * 0.41,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                    size: 50,
                                  )),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                widget.image,
                                width: size.width * 0.33,
                                height: size.height * 0.28,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.39,
                              child: Column(
                                children: [
                                  Text(
                                    widget.title,
                                    style: const TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    widget.description,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                              color: Colors.white,
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Icon(Icons.play_arrow, color: Colors.black),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, VideoInfo.rout);
                                    },
                                    icon: const Icon(
                                      Icons.info_outline_rounded,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                                const Text("Episodes&Info"),
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                )),
                          ],
                        )
                      ]),
                )));
          },
          child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
              margin: const EdgeInsets.only(right: 10),
              width: size.width * .27,
              height: size.height * .20,
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
              )),
        ));
  }
}
