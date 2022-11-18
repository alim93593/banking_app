import 'package:banking_app/domain/entities/user.dart';

class UserModel extends User{
  const UserModel({
    required super.transferFrom,
    required super.transferTo,
    required super.total,
    required super.name,
    required super.email,
    super.id
  });
  factory UserModel.fromJson(Map<String,dynamic>json){
    return  UserModel(
        id: json['id'] ,
        transferFrom: json['transferfrom'] as String,
        transferTo: json['transferto'] as String,
        total:json['total'],
        name: json['name'] as String,
        email: json['email'] as String,
    );
  }


}