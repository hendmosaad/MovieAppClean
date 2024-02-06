import 'package:bloc/bloc.dart';
import 'package:movies_app/core/no_parameters.dart';
import 'package:movies_app/movies/data/datasources/movies_remote_data_source.dart';
import 'package:movies_app/movies/data/reositories/concrete_movie_repositories.dart';
import 'package:movies_app/movies/domain/repositories/repositories.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_mpvies.dart';
import 'package:movies_app/movies/persentation/controllers/bloc/movies_events.dart';
import 'package:movies_app/movies/persentation/controllers/bloc/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvents,MoviesStates>{
  GetNowPlaying getNowPlaying;
  GetPopularMovies getPopularMovies;
  GetTopRatedMovies getTopRatedMovies;
  MoviesBloc(this.getNowPlaying,this.getPopularMovies,this.getTopRatedMovies):super(
      MoviesStates()){
    on<GetNowPalyingEvent>((event, emit) async{

     final result=  await getNowPlaying();
  result.fold((l) => emit(
    state.copyWith(nowPlayStatus:RequestStatus.error,nowPlayingMessege:l.messege )
  )
         , (r) => emit( state.copyWith(nowPlayingMovies: r,nowPlayStatus:RequestStatus.isLoaded )));});
    on<GetPopularEvent>((event, emit) async{

     final result=  await getPopularMovies();

     result.fold((l) => emit(
         state.copyWith(popularStatus:RequestStatus.error,popularMessege:l.messege )
     )
         , (r) => emit( state.copyWith(popularMovies: r,popularStatus:RequestStatus.isLoaded )));
    });
    on<GetTopRatedEvent>((event, emit) async{

     final result=  await getTopRatedMovies();
     result.fold((l) => emit(
         state.copyWith(topRatedStatus:RequestStatus.error,topRatedMessege:l.messege )
     )
         , (r) => emit( state.copyWith(topRatedMovies: r,topRatedStatus:RequestStatus.isLoaded )));});
  }

}