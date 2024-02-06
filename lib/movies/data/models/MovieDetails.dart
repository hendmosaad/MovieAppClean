
import 'package:movies_app/movies/data/models/generes.dart';

class MovieDetails {
  final String backdrop_path;
  final int id;
  final dynamic runtime;
  final String original_title;
  final String release_date;
  final String overview;
  final dynamic vote_average;
  final List<GenresModel> genress;

  MovieDetails(
      {required this.backdrop_path,
      required this.id,
      required this.original_title,
      required this.release_date,
      required this.overview,
      required this.vote_average,
    required  this.genress,
        required this.runtime
      });
  factory MovieDetails.fromJson(
      Map<String,dynamic>json
      ){
    return MovieDetails(
        backdrop_path: json['backdrop_path'],
        id:json ['id'],
        original_title: json['original_title'],
        release_date:json ['release_date'],
        overview: json['overview'],
        vote_average: json['vote_average'],
        runtime: json['runtime'],
        genress: List<GenresModel>.from(json['genres'].map((e)=>GenresModel.fromJson(e))));
  }
}
