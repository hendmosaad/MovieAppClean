
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/failure.dart';
import 'package:movies_app/core/get_movie_parameteres.dart';
import 'package:movies_app/movies/data/models/MovieDetails.dart';
import 'package:movies_app/movies/data/models/MovieModel.dart';
import 'package:movies_app/movies/domain/repositories/repositories.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details.dart';

class GetMovieDetailesUseCase {
  BaseMoviesRepository baseMoviesRepository;
  GetMovieDetailesUseCase(this.baseMoviesRepository);

  Future<Either<Failure, MovieDetails>>call( GetMovieUseCaseParameter getMovieUseCaseParameter)async {
 return  await   baseMoviesRepository.getMovieDetails( getMovieUseCaseParameter);

  }



 //  Future<Either<Failure, MovieDetails>> call(GetMovieUseCaseParameters Parameteres) async{
 // return  await   baseMoviesRepository.getMovieDetails(Parameteres);
 //  }


}
