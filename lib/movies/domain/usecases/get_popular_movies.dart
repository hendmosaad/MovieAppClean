import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failure.dart';
import 'package:movies_app/movies/domain/entites/movies.dart';
import 'package:movies_app/movies/domain/repositories/repositories.dart';
import 'package:movies_app/core/no_parameters.dart';
class GetPopularMovies {
  BaseMoviesRepository baseMoviesRepository;
  GetPopularMovies(this.baseMoviesRepository);

  Future<Either<Failure,List<Movies>>> call()async{
    return await baseMoviesRepository.getPopularMovies();

  }

}

