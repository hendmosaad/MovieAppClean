import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failure.dart';
import 'package:movies_app/core/get_movie_parameteres.dart';
import 'package:movies_app/core/recommendation_parameters.dart';
import 'package:movies_app/movies/data/models/MovieDetails.dart';
import 'package:movies_app/movies/domain/entites/movies.dart';
import 'package:movies_app/movies/domain/entites/movies_recommendations.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations.dart';

abstract class BaseMoviesRepository{
 Future<Either<Failure,List<Movies>>> getNowPlaying();
 Future<Either<Failure,List<Movies>>> getPopularMovies();
 Future<Either<Failure,List<Movies>>> getTopRatedMovies();
 Future<Either<Failure, MovieDetails>> getMovieDetails(GetMovieUseCaseParameter getMovieUseCaseParameter);
 Future<Either<Failure, List<MoviesRecomendations>>> getMovieRecommendations(RecommendationParameteres recommendationParameteres );
}