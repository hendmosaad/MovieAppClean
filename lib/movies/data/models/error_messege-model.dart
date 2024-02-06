class MessegeModel{
  final bool success;
  final int status_code;
  final bool status_messege;
  MessegeModel({required this.success,required this.status_code,required this.status_messege});
  factory MessegeModel.fromJson({required Map<String,dynamic>json})=>
      MessegeModel(success: json['success'], status_code: json['status_code'], status_messege:json ['status_messege']);

}