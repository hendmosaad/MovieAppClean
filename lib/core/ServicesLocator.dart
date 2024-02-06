import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasources/movies_remote_data_source.dart';
import 'package:movies_app/movies/data/reositories/concrete_movie_repositories.dart';
import 'package:movies_app/movies/domain/repositories/repositories.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_mpvies.dart';
import 'package:movies_app/movies/persentation/controllers/bloc/movie_details_bloc.dart';
import 'package:movies_app/movies/persentation/controllers/bloc/movies_bloc.dart';

final getIt = GetIt.instance;
class ServicesLocator
{
  void init(){
  //UseCase
  getIt.registerLazySingleton<GetNowPlaying>(() => GetNowPlaying(getIt()));
  getIt.registerLazySingleton<GetPopularMovies>(() => GetPopularMovies(getIt()));
  getIt.registerLazySingleton<GetTopRatedMovies>(() => GetTopRatedMovies(getIt()));
  getIt.registerLazySingleton<GetMovieDetailesUseCase>(() => GetMovieDetailesUseCase(getIt()));
  getIt.registerLazySingleton<GetRecommendationsUseCase>(() => GetRecommendationsUseCase(getIt()));
  //DataSource
  getIt.registerLazySingleton<BaseMoviesRemoteDataSource>(() => MoviesRemoteDataSource());
  //Repository
  getIt.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(getIt()));
  // MovieBloc
  getIt.registerLazySingleton<MoviesBloc>(() => MoviesBloc(getIt(),getIt(),getIt()))  ;
  getIt.registerLazySingleton<MovieDetailsBloc>(() => MovieDetailsBloc(getIt(),getIt()))  ;
}
}

