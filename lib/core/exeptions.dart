import 'package:flutter/foundation.dart';
import 'package:movies_app/movies/data/models/error_messege-model.dart';

class ServerExceptions implements Exception{
  final MessegeModel messegeModel;
 const ServerExceptions(this.messegeModel);

}
class LocalExceptions extends FormatException{
  final String messege;
  const LocalExceptions(this.messege);

}
