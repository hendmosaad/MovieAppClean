import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/failure.dart';
import 'package:movies_app/movies/domain/entites/movies_recommendations.dart';
import 'package:movies_app/movies/domain/repositories/repositories.dart';
import 'package:movies_app/core/recommendation_parameters.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations.dart';

class GetRecommendationsUseCase  {
  BaseMoviesRepository baseMoviesRepository;
  GetRecommendationsUseCase(this.baseMoviesRepository);
  Future<Either<Failure, List<MoviesRecomendations>>> call(RecommendationParameteres recommendationParameteres)async {
    return  await   baseMoviesRepository.getMovieRecommendations( recommendationParameteres);}


  
}
