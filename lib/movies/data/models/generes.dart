import 'package:equatable/equatable.dart';

class genres extends Equatable{
 final int id;
 final String name;

  const genres({required this.id,required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [id,name];
}
class GenresModel extends genres{
  GenresModel({required super.id, required super.name});
  factory GenresModel.fromJson(Map<String,dynamic>json)
  {
   return GenresModel(id: json['id'], name:json ['name']);
  }
}