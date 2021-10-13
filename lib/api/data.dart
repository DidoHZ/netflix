// ignore_for_file: prefer_typing_uninitialized_variables

class Data {
  var id, rating, title, poster, backdrop, description, year, type; //String
  var adult; // bool
  var geners; //List<int> Map<int,String>

  Data(this.id, this.title, this.poster, this.backdrop, this.description,
      this.year, this.rating, this.adult, this.type, this.geners);

  Data.fromJson(Map<String, dynamic> json, String type)
      : id = json['id'].toString(),
        title = type == "movie" ? json['title'] : json['name'],
        poster = "https://image.tmdb.org/t/p/original/" + json['poster_path'],
        backdrop = "https://image.tmdb.org/t/p/w1280/" + json['backdrop_path'],
        description = json['overview'],
        year = type == "movie" ? json['release_date'] : json["first_air_date"],
        rating = json['vote_average'],
        geners = json['genre_ids'],
        adult = json['adult'],
        type = type == "movie" ? json['media_type'] : "tv";
}
