part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent extends Equatable{
 const MovieDetailsEvent();


 @override
 // TODO: implement props
 List<Object?> get props => throw UnimplementedError();

}
 class GetMovieDetailsEvent extends MovieDetailsEvent {
 final int id;
 const  GetMovieDetailsEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
 }

class GetMovieRecomindationsEvent extends MovieDetailsEvent {
 final int id;

 const GetMovieRecomindationsEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
