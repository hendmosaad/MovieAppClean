class Failure {
 final String messege;

 const Failure(this.messege);
}
class ServerFailure extends Failure{
  ServerFailure(super.messege);
}
class LocalFailure extends Failure{
  LocalFailure(super.messege);

}