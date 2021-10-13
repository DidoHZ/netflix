import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'data.dart';

String BASEURL = "https://api.themoviedb.org/3/";
String API = "?api_key=c4ca447c00aab9e96d6f9b202dbdf289";

Future<dynamic> getTrends({required String type, bool top = false}) async {
  final response =
      await http.get(Uri.parse(BASEURL + "trending/" + type + "/day" + API));

  if (response.statusCode == 200) {
    print("connect succéd..");

    List<dynamic> result = json.decode(response.body)['results'];

    if (top) return Data.fromJson(result[0], result[0]['media_type']);

    List<int> list = [];

    for (int i = 1; i < result.length; ++i) list.add(result[i]['id']);

    return list;
  } else {
    throw Exception('Failed to load post');
  }
}

Future<List<List<String>>> getCat({required String type, required int cat}) async {
  int count = 0, page = 0;
  List<List<String>> list = [];

  while (count < 10 && count != -1) {
    final response = await http.get(Uri.parse(BASEURL +
        "trending/" +
        type +
        "/day" +
        API +
        "&page=" +
        (++page).toString()));

    if (response.statusCode == 200) {
      print("connect succéd..");

      List<dynamic> result = json.decode(response.body)['results'];

      for (int i = 0; i < result.length; ++i) {
        if (result[i]['genre_ids'].contains(cat)) {
          list.add([result[i]['id'].toString(),result[i]['media_type']]);
          count++;
        }
      }
    } else {
      throw Exception('Failed to load post');
    }
  }
  return list;
}

Future<Data> details(String id, String type) async {
  final response = await http.get(Uri.parse(BASEURL + type + "/" + id + API));

  if (response.statusCode == 200) {
    print("connect succéd..");

    Map<String, dynamic> result = json.decode(response.body);

    Data data = Data.fromJson(result, type);

    print(data.backdrop);

    return data;
  } else {
    throw Exception('Failed to load post');
  }
}

int getGenerId(String gen) {
  for (var x in geners.keys) if (geners[x] == gen) return x;
  return 0;
}

Map<int, String> geners = {
  28: "Action",
  12: "Adventure",
  16: "Animation",
  35: "Comedy",
  80: "Crime",
  99: "Documentary",
  18: "Drama",
  10751: "Family",
  10762: "Kids",
  14: "Fantasy",
  36: "History",
  27: "Horror",
  10765: "Sci-Fi & Fantasy",
  10402: "Music",
  9648: "Mystery",
  10763: "News",
  10766: "Soap",
  10764: "Reality",
  10768: "War & Politics",
  10749: "Romance",
  878: "Science Fiction",
  10767: "Talk",
  10770: "TV Movie",
  53: "Thriller",
  10752: "War",
  37: "Western",
  10759: "Action & Adventure"
};
