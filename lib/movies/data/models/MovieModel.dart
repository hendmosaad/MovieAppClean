import 'package:movies_app/movies/domain/entites/movies.dart';

class MovieModel extends Movies{
  MovieModel({required super.id, required super.backdropPath, required super.title, required super.overView, required super.voteAverage, required super.genderIds, required super.releaseDate});
factory MovieModel.fromjson(Map<String,dynamic>json)=>
     MovieModel(
           id: json['id']
         , backdropPath:json['backdrop_path']
         , title:  json['title'], overView: json['overView']
         , voteAverage: json['vote_average']
         , genderIds:List<int>.from(json['genre_ids'].map((e)=>e))
         , releaseDate: json['release_date'] );

}