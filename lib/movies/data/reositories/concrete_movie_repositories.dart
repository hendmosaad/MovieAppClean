import 'package:dartz/dartz.dart';
import 'package:movies_app/core/exeptions.dart';
import 'package:movies_app/core/failure.dart';
import 'package:movies_app/core/get_movie_parameteres.dart';
import 'package:movies_app/movies/data/datasources/movies_remote_data_source.dart';
import 'package:movies_app/movies/data/models/MovieDetails.dart';
import 'package:movies_app/movies/data/models/MovieModel.dart';
import 'package:movies_app/movies/domain/entites/movies.dart';
import 'package:movies_app/movies/domain/entites/movies_recommendations.dart';
import 'package:movies_app/movies/domain/repositories/repositories.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations.dart';
import 'package:movies_app/core/recommendation_parameters.dart';

class   MovieRepository extends BaseMoviesRepository {
  BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;
  MovieRepository (this.baseMoviesRemoteDataSource);
  @override
  Future<Either<Failure,List<Movies>>> getNowPlaying()async {
    final result= await baseMoviesRemoteDataSource.getNowPlayingFromRemoteDataSource();

    try {

     return result ;
    }
     on ServerExceptions catch(failure){
      return Left(ServerFailure(failure.messegeModel.status_messege as String));
    }
  }

  @override
  Future<Either<Failure,List<Movies>>> getPopularMovies() async{
    final result=await baseMoviesRemoteDataSource.getNowPopularFromRemoteDataSource();
    try {
      return result ;
    }on ServerExceptions catch(failure){
      return Left(ServerFailure(failure.messegeModel.status_messege as String));
    }
  }

  @override
  Future<Either<Failure,List<Movies>>> getTopRatedMovies() async{
    final result= await baseMoviesRemoteDataSource.getNowTopRatedFromRemoteDataSource();
    try {
      return result ;
    }on ServerExceptions catch(failure){
      return Left(ServerFailure(failure.messegeModel.status_messege as String));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(GetMovieUseCaseParameter getMovieUseCaseParameter)async {
      final result= await baseMoviesRemoteDataSource.getMovieDetailsFromRemoteDataSource(getMovieUseCaseParameter: getMovieUseCaseParameter);
      try {
        return Right(result) ;
      }on ServerExceptions catch(failure){
        return Left(ServerFailure(failure.messegeModel.status_messege as String));
      }
  }
  // a

  @override
  Future<Either<Failure, List<MoviesRecomendations>>> getMovieRecommendations(RecommendationParameteres recommendationParameteres)async {
    final result= await baseMoviesRemoteDataSource.getMovieRecommendationsFromRemoteDataSource(recommendationParameteres: recommendationParameteres);
    try {
      return result;
    }on ServerExceptions catch(failure){
      return Left(ServerFailure(failure.messegeModel.status_messege as String));
    }
  }

  


  // @override
  //
  // Future<Either<Failure, List<MoviesRecomendations>>>getMovieRecommendations(RecommendationParameteres parameteres)async {
  //     final result= await baseMoviesRemoteDataSource.getMovieRecommendationsFromRemoteDataSource(id: parameteres);
  //     // try {
  //     //   return Right(result) ;
  //     // }on ServerExceptions catch(failure){
  //     //   return Left(ServerFailure(failure.messegeModel.status_messege as String));
  //     // }
  // }





}