import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entites/movies.dart';

enum RequestStatus {
  isLoaded,
   isLoading,
   error,
}
class MoviesStates extends Equatable {
final List <Movies> nowPlayingMovies;
final RequestStatus nowPlayStatus;
final String nowPlayingMessege;
final List <Movies> popularMovies;
final RequestStatus popularStatus;
final String popularMessege;
final List <Movies> topRatedMovies;
final RequestStatus topRatedStatus;
final String topRatedMessege;
 MoviesStates copyWith({
   List <Movies>? nowPlayingMovies,
   RequestStatus? nowPlayStatus,
   String? nowPlayingMessege,
   List <Movies>? popularMovies,
   RequestStatus? popularStatus,
   String? popularMessege,
   List <Movies>? topRatedMovies,
   RequestStatus? topRatedStatus,
   String? topRatedMessege,
}){

   return MoviesStates(
     nowPlayingMovies: nowPlayingMovies??this.nowPlayingMovies,
     nowPlayingMessege: nowPlayingMessege??this.nowPlayingMessege,
     nowPlayStatus: nowPlayStatus??this.nowPlayStatus,
     popularMovies: popularMovies??this.popularMovies,
     popularStatus: popularStatus??this.popularStatus,
     popularMessege: popularMessege??this.popularMessege,
     topRatedMovies:topRatedMovies??this.topRatedMovies,
     topRatedMessege:topRatedMessege??this.topRatedMessege,
     topRatedStatus:topRatedStatus??this.topRatedStatus,

   );
 }
  MoviesStates({
    this.nowPlayingMovies=const [],
    this.nowPlayStatus=RequestStatus. isLoading,
    this.nowPlayingMessege='',
    this.popularMovies=const [],
    this.popularStatus=RequestStatus. isLoading,
    this.popularMessege='',
    this.topRatedMovies=const [],
    this.topRatedStatus=RequestStatus. isLoading,
    this.topRatedMessege='',

  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    nowPlayingMovies,
    nowPlayStatus,
    nowPlayingMessege,
    popularMovies,
    popularStatus,
    popularMessege,
    topRatedMovies,
    topRatedStatus,
    topRatedMessege
  ];

}