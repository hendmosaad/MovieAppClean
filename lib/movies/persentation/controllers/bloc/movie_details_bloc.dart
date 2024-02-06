import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/core/get_movie_parameteres.dart';
import 'package:movies_app/core/recommendation_parameters.dart';
import 'package:movies_app/movies/data/models/MovieDetails.dart';
import 'package:movies_app/movies/domain/entites/movies_recommendations.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations.dart';
import 'package:movies_app/movies/persentation/controllers/bloc/movies_states.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsInitial> {
  GetMovieDetailesUseCase getMovieDetailesUseCase;
  GetRecommendationsUseCase getRecommendationsUseCase;

  MovieDetailsBloc(this.getMovieDetailesUseCase,this.getRecommendationsUseCase) : super(MovieDetailsInitial()) {
    on<GetMovieDetailsEvent>((event, emit)async {
    final result =  await getMovieDetailesUseCase( GetMovieUseCaseParameter(id:event.id));
    result.fold((l) =>
        emit(
            state .CopyWith(
                movieDetailsRequestState: RequestStatus.error,
              messege: l.messege
            )
        ), (r) =>   emit(
       state.CopyWith(
            movieDetailsRequestState: RequestStatus.isLoaded,
          movieDetails: r

        )));

    });
    on<GetMovieRecomindationsEvent>((event, emit)async {
      final result =  await getRecommendationsUseCase(RecommendationParameteres(id: event.id));
      result.fold((l) =>
          emit(
              state.CopyWith(
                 movieRecomendationRequestState: RequestStatus.error,
                  messege: l.messege
              )
          ), (r) =>   emit(
        state.CopyWith(
              movieRecomendationRequestState: RequestStatus.isLoaded,
              MovieRecomendation: r

          )));

    });

  }
}
