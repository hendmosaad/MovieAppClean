import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/conestances.dart';
import 'package:movies_app/core/exeptions.dart';
import 'package:movies_app/core/failure.dart';
import 'package:movies_app/core/get_movie_parameteres.dart';
import 'package:movies_app/core/recommendation_parameters.dart';
import 'package:movies_app/movies/data/models/MovieDetails.dart';
import 'package:movies_app/movies/data/models/MovieModel.dart';
import 'package:movies_app/movies/data/models/error_messege-model.dart';
import 'package:movies_app/movies/domain/entites/movies.dart';
import 'package:movies_app/movies/domain/entites/movies_recommendations.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations.dart';
abstract class BaseMoviesRemoteDataSource{
  Future<Either<Failure,List<MovieModel>>>getNowPlayingFromRemoteDataSource();
  Future<Either<Failure,List<MovieModel>>>getNowPopularFromRemoteDataSource();
  Future<Either<Failure,List<MovieModel>>>getNowTopRatedFromRemoteDataSource();
  Future<MovieDetails>getMovieDetailsFromRemoteDataSource({required GetMovieUseCaseParameter getMovieUseCaseParameter});
  Future<Either<Failure,List<MoviesRecomendations>>>getMovieRecommendationsFromRemoteDataSource({required RecommendationParameteres recommendationParameteres});
}
class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource{
  @override
  Future<Either<Failure,List<MovieModel>>>getNowPlayingFromRemoteDataSource()async{
    final response=await Dio().get('${AppConexstances.baseUrl}/${AppConexstances.nowPlaying}?api_key=${AppConexstances.apiKey}');
    // print(response.data['results']);
    if (response.statusCode==200)
    {
      return Right(await List <MovieModel>.from((response.data['results'] as List ).map((e) => MovieModel.fromjson(e))));

    }
    else {
    throw ServerExceptions(MessegeModel.fromJson(json: response.data));
    }
  }
  @override
  Future<Either<Failure,List<MovieModel>>>getNowPopularFromRemoteDataSource()async{
    final response=await Dio().get('${AppConexstances.baseUrl}/${AppConexstances.popularPlaying}?api_key=${AppConexstances.apiKey}');
    if (response.statusCode==200)
    {
      return await Right(List <MovieModel>.from((response.data['results'] as List ).map((e) => MovieModel.fromjson(e))));

    }
    else {
    throw ServerExceptions(MessegeModel.fromJson(json: response.data));
    }
  }
  @override
  Future<Either<Failure,List<MovieModel>>>getNowTopRatedFromRemoteDataSource()async{
    final response=await Dio().get('${AppConexstances.baseUrl}/${AppConexstances.topRated}?api_key=${AppConexstances.apiKey}');
    if (response.statusCode==200)
    {
      return Right( await List <MovieModel>.from((response.data['results'] as List ).map((e) => MovieModel.fromjson(e))));

    }
    else {
    throw ServerExceptions(MessegeModel.fromJson(json: response.data));
    }
  }

  @override
  Future<MovieDetails> getMovieDetailsFromRemoteDataSource({required GetMovieUseCaseParameter getMovieUseCaseParameter})async {
    final response=await Dio().get('${AppConexstances.getMovieDetails(getMovieUseCaseParameter.id)}');
    if (response.statusCode==200)
    {
      return MovieDetails.fromJson(response.data);
    }
    else {
    throw ServerExceptions(MessegeModel.fromJson(json: response.data));
    }
  }



  @override
  Future<Either<Failure, List<MoviesRecomendations>>> getMovieRecommendationsFromRemoteDataSource({required RecommendationParameteres recommendationParameteres})async {
  final response= await Dio().get(AppConexstances.getMoviesRecomindations(recommendationParameteres.id));
  if (response.statusCode==200){
    return Right( await List <MoviesRecomendations>.from((response.data['results'] as List ).map((e) => MoviesRecomendations.fromJson(e))));
  }else{
    throw ServerExceptions(MessegeModel.fromJson(json: response.data));

  }
  }



}