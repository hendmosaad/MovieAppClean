part of 'movie_details_bloc.dart';


class MovieDetailsInitial  {
  // MovieDetails(
  //
  // backdrop_path: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
  // id:438148,
  // original_title:  "Minions: The Rise of Gru" ,
  // release_date:"2022-06-29",
  // overview:  "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.",
  //
  // vote_average: 7.8,
  // genress:const [],
  // runtime:117
  // )
   MovieDetails? movieDetails ;
  final RequestStatus movieDetailsRequestState;
  final String messege;
  final List<MoviesRecomendations>MovieRecomendation;
  final RequestStatus movieRecomendationRequestState;
  final String RecommendationMessege;

  MovieDetailsInitial(
      {
        this.movieDetails,
      this.movieDetailsRequestState = RequestStatus.isLoading,
      this.messege='',
        this.MovieRecomendation=const [],
        this.movieRecomendationRequestState=RequestStatus.isLoading,
        this.RecommendationMessege=''
      });

   MovieDetailsInitial CopyWith({
    MovieDetails? movieDetails,
    RequestStatus ?movieDetailsRequestState,
    String? messege,
     List<MoviesRecomendations>?MovieRecomendation,
     RequestStatus? movieRecomendationRequestState,
     String? RecommendationMessege,
  }){
    return MovieDetailsInitial(
        movieDetails: movieDetails??this.movieDetails,
        messege: messege??this.messege,
        movieDetailsRequestState: movieDetailsRequestState??this.movieDetailsRequestState,
      MovieRecomendation:MovieRecomendation??this.MovieRecomendation ,
      movieRecomendationRequestState:movieRecomendationRequestState??this.movieRecomendationRequestState ,
      RecommendationMessege: RecommendationMessege??this.RecommendationMessege
    );



  }
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
