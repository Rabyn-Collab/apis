import 'package:flutter_ex/models/config.dart';
import 'package:get_it/get_it.dart';

class Movie{
final String name;
final String language;
final bool isAdult;
final String description;
final String posterPath;
final String backdropPath;
final num rating;
final String releaseYear;

Movie({
  this.name,
  this.description,
  this.backdropPath,
  this.isAdult,
  this.language,
  this.posterPath,
  this.rating,
  this.releaseYear
});

factory Movie.fromJson(Map<String, dynamic> json){
  return Movie(
    name: json['title'],
    language: json['original_language'],
    isAdult: json['adult'],
    description: json['overview'],
    posterPath: json['poster_path'],
    backdropPath: json['backdrop_path'],
    rating: json['vote_average'],
    releaseYear: json['release_date']
  );
}

String posterUrl(){
  final AppConfig _appConfig = GetIt.instance.get<AppConfig>();
return '${_appConfig.BASE_IMAGE_API_URL}${this.posterPath}';
}

}