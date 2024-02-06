import 'package:equatable/equatable.dart';

class GetMovieUseCaseParameter extends Equatable{
  final int id;
//  final  String name;

  const  GetMovieUseCaseParameter({required this.id});

  @override
  List<Object?> get props => [id];
}