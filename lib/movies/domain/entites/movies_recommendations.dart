import 'package:equatable/equatable.dart';
import 'package:movies_app/core/recommendation_parameters.dart';

class MoviesRecomendations  extends Equatable{
  final String? backdrop_path;
  final int id;

 const MoviesRecomendations({ this.backdrop_path, required this.id});
  factory MoviesRecomendations.fromJson(Map<String,dynamic>json){
    return MoviesRecomendations(backdrop_path:json['backdrop_path']??'/yyFc8Iclt2jxPmLztbP617xXllT.jpg', id:json['id']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [backdrop_path,id];

}