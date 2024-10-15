import 'package:app_services/app_services.dart';

import '../../interactor/entities/series.dart';

class SerieAdapter extends EntityAdaptor<Serie> {
  @override
  Serie fromJson(json) {
    return Serie(
        id: Helper.getString(json["id"]),
        name: Helper.getString(json["original_name"]),
        description: Helper.getString(json["overview"]),
        releaseDate: Helper.getString(json["first_air_date"]),
        backgroundImage: Utils.imageBasePath + Helper.getString(json["backdrop_path"]),
        postImage: Utils.imageBasePath + Helper.getString(json["poster_path"]));
  }

  @override
  List<Serie> fromJsonToList(json) {
    if (json == null) return [];
    List<Serie> series = [];

    json['results'].forEach((e) {
      final Serie movie = SerieAdapter().fromJson(e);
      series.add(movie);
    });
    return series;
  }

  @override
  Map<String, dynamic> toMap(Serie value) => {};
}
